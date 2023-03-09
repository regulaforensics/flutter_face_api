package io.flutter.plugins.regula.faceapi.flutter_face_api;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Handler;
import android.os.Looper;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.Iterator;
import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Locale;

import com.regula.facesdk.configuration.FaceCaptureConfiguration;
import com.regula.facesdk.configuration.LivenessConfiguration;
import com.regula.facesdk.configuration.MatchFaceConfiguration;
import com.regula.facesdk.exception.InitException;
import com.regula.facesdk.model.results.matchfaces.MatchFacesComparedFacesPair;
import com.regula.facesdk.model.results.matchfaces.MatchFacesSimilarityThresholdSplit;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

import static com.regula.facesdk.FaceSDK.Instance;

@SuppressWarnings({"unchecked", "NullableProblems", "ConstantConditions", "RedundantSuppression"})
public class FlutterFaceApiPlugin implements FlutterPlugin, MethodChannel.MethodCallHandler {
    private ArrayList<Object> args;
    private Context context;

    private EventChannel.EventSink eventVideoEncoderCompletion;

    public FlutterFaceApiPlugin() {
    }

    private Context getContext() {
        return context;
    }

    @Override
    public void onAttachedToEngine(FlutterPluginBinding flutterPluginBinding) {
        context = flutterPluginBinding.getApplicationContext();
        new EventChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_face_api/event/video_encoder_completion").setStreamHandler(new EventChannel.StreamHandler() {
            @Override
            public void onListen(Object arguments, EventChannel.EventSink events) {
                eventVideoEncoderCompletion = events;
            }

            @Override
            public void onCancel(Object arguments) {
            }
        });
        new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_face_api/method").setMethodCallHandler(this);
    }

    @Override
    public void onDetachedFromEngine(FlutterPluginBinding binding) {
    }

    @SuppressWarnings("unused")
    private interface Callback {
        void success(Object o);

        void error(String s);

        default void success() {
            success("");
        }
    }

    private JSONArray arrayListToJSONArray(ArrayList<?> list) {
        JSONArray result = new JSONArray();
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getClass().equals(java.util.HashMap.class))
                result.put(hashMapToJSONObject((HashMap<String, ?>) list.get(i)));
            else if (list.get(i).getClass().equals(java.util.ArrayList.class))
                result.put(arrayListToJSONArray((ArrayList<?>) list.get(i)));
            else
                result.put(list.get(i));
        }

        return result;
    }

    private JSONObject hashMapToJSONObject(HashMap<String, ?> map) {
        JSONObject result = new JSONObject();
        try {
            for (Map.Entry<String, ?> entry : map.entrySet()) {
                if (entry.getValue().getClass().equals(java.util.HashMap.class))
                    result.put(entry.getKey(), hashMapToJSONObject((HashMap<String, ?>) entry.getValue()));
                else if (entry.getValue().getClass().equals(java.util.ArrayList.class))
                    result.put(entry.getKey(), arrayListToJSONArray((ArrayList<?>) entry.getValue()));
                else
                    result.put(entry.getKey(), entry.getValue());
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return result;
    }

    private <T> T args(@SuppressWarnings("SameParameterValue") int index) {
        if (args.get(index).getClass().equals(java.util.HashMap.class))
            return (T) hashMapToJSONObject((HashMap<String, ?>) args.get(index));
        if (args.get(index).getClass().equals(java.util.ArrayList.class))
            return (T) arrayListToJSONArray((ArrayList<?>) args.get(index));
        return (T) args.get(index);
    }

    private void sendVideoEncoderCompletion(String transactionId, boolean success) {
        if (eventVideoEncoderCompletion != null)
            new Handler(Looper.getMainLooper()).post(() -> eventVideoEncoderCompletion.success(JSONConstructor.generateVideoEncoderCompletion(transactionId, success).toString()));
    }

    @Override
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        String action = call.method;
        args = (ArrayList<Object>) call.arguments;
        Callback callback = new Callback() {
            @Override
            public void success(Object o) {
                result.success(o);
            }

            @Override
            public void error(String s) {
                result.error("", s, null);
            }
        };

        try {
            switch (action) {
                case "getServiceUrl":
                    getServiceUrl(callback);
                    break;
                case "startLiveness":
                    startLiveness(callback);
                    break;
                case "getFaceSdkVersion":
                    getFaceSdkVersion(callback);
                    break;
                case "presentFaceCaptureActivity":
                    presentFaceCaptureActivity(callback);
                    break;
                case "stopFaceCaptureActivity":
                    stopFaceCaptureActivity(callback);
                    break;
                case "init":
                    init(callback);
                    break;
                case "deinit":
                    deinit(callback);
                    break;
                case "isInitialized":
                    isInitialized(callback);
                    break;
                case "stopLivenessProcessing":
                    stopLivenessProcessing(callback);
                    break;
                case "setRequestHeaders":
                    setRequestHeaders(callback, args(0));
                    break;
                case "presentFaceCaptureActivityWithConfig":
                    presentFaceCaptureActivityWithConfig(callback, args(0));
                    break;
                case "startLivenessWithConfig":
                    startLivenessWithConfig(callback, args(0));
                    break;
                case "setServiceUrl":
                    setServiceUrl(callback, args(0));
                    break;
                case "matchFaces":
                    matchFaces(callback, args(0));
                    break;
                case "detectFaces":
                    detectFaces(callback, args(0));
                    break;
                case "matchFacesWithConfig":
                    matchFacesWithConfig(callback, args(0), args(1));
                    break;
                case "setLanguage":
                    setLanguage(callback, args(0));
                    break;
                case "matchFacesSimilarityThresholdSplit":
                    matchFacesSimilarityThresholdSplit(callback, args(0), args(1));
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void getServiceUrl(Callback callback) {
        callback.success(Instance().getServiceUrl());
    }

    private void setRequestHeaders(Callback callback, JSONObject headers) {
        Instance().setNetworkInterceptorListener(requestBuilder -> {
            try {
                Iterator<String> keys = headers.keys();
                while (keys.hasNext()) {
                    String key = keys.next();
                    String value = (String) headers.get(key);
                    requestBuilder.header(key, value);
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
        });
        callback.success();
    }

    private void startLiveness(Callback callback) {
        Instance().startLiveness(getContext(), (response) -> callback.success(JSONConstructor.generateLivenessResponse(response).toString()));
    }

    private void detectFaces(Callback callback, String request) throws JSONException {
        Instance().detectFaces(JSONConstructor.DetectFacesRequestFromJSON(new JSONObject(request)), (response) -> callback.success(JSONConstructor.generateDetectFacesResponse(response).toString()));
    }

    private void getFaceSdkVersion(Callback callback) {
        callback.success(Instance().getFaceSdkVersion());
    }

    private void presentFaceCaptureActivity(Callback callback) {
        Instance().presentFaceCaptureActivity(getContext(), (response) -> callback.success(JSONConstructor.generateFaceCaptureResponse(response).toString()));
    }

    private void stopFaceCaptureActivity(Callback callback) {
        Instance().stopFaceCaptureActivity(getContext());
        callback.success();
    }

    private void stopLivenessProcessing(Callback callback) {
        Instance().stopLivenessProcessing(getContext());
        callback.success();
    }

    private void presentFaceCaptureActivityWithConfig(Callback callback, JSONObject config) throws JSONException {
        FaceCaptureConfiguration.Builder builder = new FaceCaptureConfiguration.Builder();
        if (config.has("copyright"))
            builder.setCopyright(config.getBoolean("copyright"));
        if (config.has("cameraId"))
            builder.setCameraId(config.getInt("cameraId"));
        if (config.has("cameraSwitchEnabled"))
            builder.setCameraSwitchEnabled(config.getBoolean("cameraSwitchEnabled"));
        if (config.has("showHelpTextAnimation"))
            builder.setShowHelpTextAnimation(config.getBoolean("showHelpTextAnimation"));
        if (config.has("closeButtonEnabled"))
            builder.setCloseButtonEnabled(config.getBoolean("closeButtonEnabled"));
        if (config.has("torchButtonEnabled"))
            builder.setTorchButtonEnabled(config.getBoolean("torchButtonEnabled"));
        if (config.has("timeout"))
            builder.setTimeout(config.getInt("timeout"));
        Instance().presentFaceCaptureActivity(getContext(), builder.build(), (response) -> callback.success(JSONConstructor.generateFaceCaptureResponse(response).toString()));
    }

    private void startLivenessWithConfig(Callback callback, JSONObject config) throws JSONException {
        LivenessConfiguration.Builder builder = new LivenessConfiguration.Builder();
        if (config.has("copyright"))
            builder.setCopyright(config.getBoolean("copyright"));
        if (config.has("attemptsCount"))
            builder.setAttemptsCount(config.getInt("attemptsCount"));
        if (config.has("sessionId"))
            builder.setSessionId(config.getString("sessionId"));
        if (config.has("skipStep"))
            builder.setSkipStep(JSONConstructor.LivenessSkipStepArrayFromJSON(config.getInt("skipStep")));
        if (config.has("showHelpTextAnimation"))
            builder.setShowHelpTextAnimation(config.getBoolean("showHelpTextAnimation"));
        if (config.has("locationTrackingEnabled"))
            builder.setLocationTrackingEnabled(config.getBoolean("locationTrackingEnabled"));
        if (config.has("closeButtonEnabled"))
            builder.setCloseButtonEnabled(config.getBoolean("closeButtonEnabled"));
        if (config.has("recordingProcess"))
            builder.setRecordingProcess(config.getBoolean("recordingProcess"));
        Instance().startLiveness(getContext(), builder.build(), (response) -> callback.success(JSONConstructor.generateLivenessResponse(response).toString()));
    }

    private void setServiceUrl(Callback callback, String url) {
        Instance().setServiceUrl(url);
        callback.success();
    }

    private void init(Callback callback) {
        Instance().init(getContext(), (boolean success, InitException error) -> {
            if (success)
                Instance().setVideoEncoderCompletion(this::sendVideoEncoderCompletion);
            callback.success(JSONConstructor.generateInitCompletion(success, error).toString());
        });
    }

    private void deinit(Callback callback) {
        Instance().deinit();
        callback.success();
    }

    private void isInitialized(Callback callback) {
        callback.success(Instance().isInitialized());
    }

    private void matchFaces(Callback callback, String request) throws JSONException {
        Instance().matchFaces(JSONConstructor.MatchFacesRequestFromJSON(new JSONObject(request)), (response) -> callback.success(JSONConstructor.generateMatchFacesResponse(response).toString()));
    }

    private void matchFacesWithConfig(Callback callback, String request, @SuppressWarnings("unused") JSONObject config) throws JSONException {
        MatchFaceConfiguration.Builder builder = new MatchFaceConfiguration.Builder();
        Instance().matchFaces(JSONConstructor.MatchFacesRequestFromJSON(new JSONObject(request)), builder.build(), (response) -> callback.success(JSONConstructor.generateMatchFacesResponse(response).toString()));
    }

    private void matchFacesSimilarityThresholdSplit(Callback callback, String array, Double similarity) throws JSONException {
        List<MatchFacesComparedFacesPair> faces = JSONConstructor.listFromJSON(new JSONArray(array), JSONConstructor::MatchFacesComparedFacesPairFromJSON);
        MatchFacesSimilarityThresholdSplit split = new MatchFacesSimilarityThresholdSplit(faces, similarity);
        callback.success(JSONConstructor.generateMatchFacesSimilarityThresholdSplit(split).toString());
    }

    private void setLanguage(Callback callback, String language) {
        Locale locale = new Locale(language);
        Locale.setDefault(locale);
        Resources resources = getContext().getResources();
        Configuration config = resources.getConfiguration();
        config.setLocale(locale);
        resources.updateConfiguration(config, resources.getDisplayMetrics());
        callback.success();
    }
}