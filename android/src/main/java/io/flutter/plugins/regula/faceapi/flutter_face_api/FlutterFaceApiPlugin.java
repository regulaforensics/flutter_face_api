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

import com.regula.facesdk.callback.PersonDBCallback;
import com.regula.facesdk.configuration.FaceCaptureConfiguration;
import com.regula.facesdk.configuration.LivenessConfiguration;
import com.regula.facesdk.configuration.MatchFaceConfiguration;
import com.regula.facesdk.exception.InitException;
import com.regula.facesdk.model.results.matchfaces.MatchFacesComparedFacesPair;
import com.regula.facesdk.model.results.matchfaces.MatchFacesSimilarityThresholdSplit;
import com.regula.facesdk.model.results.personDb.DbBaseItem;
import com.regula.facesdk.model.results.personDb.PageableItemList;

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

    private EventChannel.EventSink onCustomButtonTappedEvent;

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
        new EventChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_face_api/event/onCustomButtonTappedEvent").setStreamHandler(new EventChannel.StreamHandler() {
            @Override
            public void onListen(Object arguments, EventChannel.EventSink events) {
                onCustomButtonTappedEvent = events;
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

    void sendOnCustomButtonTappedEvent(int tag) {
        if (onCustomButtonTappedEvent != null)
            new Handler(Looper.getMainLooper()).post(() -> onCustomButtonTappedEvent.success(tag));
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
                case "setOnCustomButtonTappedListener":
                    setOnCustomButtonTappedListener(callback);
                    break;
                case "setUiCustomizationLayer":
                    setUiCustomizationLayer(callback, args(0));
                    break;
                case "setLanguage":
                    setLanguage(callback, args(0));
                    break;
                case "matchFacesSimilarityThresholdSplit":
                    matchFacesSimilarityThresholdSplit(callback, args(0), args(1));
                    break;
                case "getPersons":
                    getPersons(callback);
                    break;
                case "getPersonsForPage":
                    getPersonsForPage(callback, args(0), args(1));
                    break;
                case "getPerson":
                    getPerson(callback, args(0));
                    break;
                case "createPerson":
                    createPerson(callback, args(0), args(1));
                    break;
                case "updatePerson":
                    updatePerson(callback, args(0), args(1), args(2));
                    break;
                case "deletePerson":
                    deletePerson(callback, args(0));
                    break;
                case "getPersonImages":
                    getPersonImages(callback, args(0));
                    break;
                case "getPersonImagesForPage":
                    getPersonImagesForPage(callback, args(0), args(1), args(2));
                    break;
                case "addPersonImage":
                    addPersonImage(callback, args(0), args(1));
                    break;
                case "getPersonImage":
                    getPersonImage(callback, args(0), args(1));
                    break;
                case "deletePersonImage":
                    deletePersonImage(callback, args(0), args(1));
                    break;
                case "getGroups":
                    getGroups(callback);
                    break;
                case "getGroupsForPage":
                    getGroupsForPage(callback, args(0), args(1));
                    break;
                case "getPersonGroups":
                    getPersonGroups(callback, args(0));
                    break;
                case "getPersonGroupsForPage":
                    getPersonGroupsForPage(callback, args(0), args(1), args(2));
                    break;
                case "createGroup":
                    createGroup(callback, args(0), args(1));
                    break;
                case "getGroup":
                    getGroup(callback, args(0));
                    break;
                case "updateGroup":
                    updateGroup(callback, args(0), args(1), args(2));
                    break;
                case "editPersonsInGroup":
                    editPersonsInGroup(callback, args(0), args(1));
                    break;
                case "getPersonsInGroup":
                    getPersonsInGroup(callback, args(0));
                    break;
                case "getPersonsInGroupForPage":
                    getPersonsInGroupForPage(callback, args(0), args(1), args(2));
                    break;
                case "deleteGroup":
                    deleteGroup(callback, args(0));
                    break;
                case "searchPerson":
                    searchPerson(callback, args(0));
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
            builder.setTag(config.getString("tag"));
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

    private void setOnCustomButtonTappedListener(Callback callback) {
        Instance().setOnClickListener(view -> sendOnCustomButtonTappedEvent((int) view.getTag()));
        callback.success();
    }

    private void setUiCustomizationLayer(Callback callback, JSONObject json) {
        Instance().getCustomization().setUiCustomizationLayer(json);
        callback.success();
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

    <T> PersonDBCallback<T> createPersonDBCallback(Callback callback, JSONConstructor.JSONObjectGenerator<T> generator) {
        return new PersonDBCallback<T>() {
            @Override
            public void onSuccess(T t) {
                try {
                    if (generator == null)
                        callback.success();
                    callback.success(generator.generateJSONObject(t).toString());
                } catch (JSONException e) {
                    callback.error(e.toString());
                }
            }

            @Override
            public void onFailure(String s) {
                callback.error(s);
            }
        };
    }

    <T> PersonDBCallback<List<T>> createPersonDBListCallback(Callback callback, JSONConstructor.JSONObjectGenerator<T> generator) {
        return new PersonDBCallback<List<T>>() {
            @Override
            public void onSuccess(List<T> list) {
                try {
                    callback.success(JSONConstructor.generateList(list, generator).toString());
                } catch (JSONException e) {
                    callback.error(e.toString());
                }
            }

            @Override
            public void onFailure(String s) {
                callback.error(s);
            }
        };
    }

    <T extends DbBaseItem> PersonDBCallback<PageableItemList<List<T>, T>> createPersonDBPageableListCallback(Callback callback, JSONConstructor.JSONObjectGenerator<T> generator) {
        return new PersonDBCallback<PageableItemList<List<T>, T>>() {
            @Override
            public void onSuccess(PageableItemList<List<T>, T> listTPageableItemList) {
                try {
                    callback.success(JSONConstructor.generateList(listTPageableItemList.getItemsList(), generator).toString());
                } catch (JSONException e) {
                    callback.error(e.toString());
                }
            }

            @Override
            public void onFailure(String s) {
                callback.error(s);
            }
        };
    }

    private void getPersons(Callback callback) {
        Instance().personDatabase().getPersons(createPersonDBPageableListCallback(callback, JSONConstructor::generatePerson));
    }

    private void getPersonsForPage(Callback callback, int page, int size) {
        Instance().personDatabase().getPersonsForPage(page, size, createPersonDBPageableListCallback(callback, JSONConstructor::generatePerson));
    }

    private void getPerson(Callback callback, int personId) {
        Instance().personDatabase().getPerson(personId, createPersonDBCallback(callback, JSONConstructor::generatePerson));
    }

    private void createPerson(Callback callback, String name, JSONObject metadata) {
        Instance().personDatabase().createPerson(name, metadata, createPersonDBCallback(callback, JSONConstructor::generatePerson));
    }

    private void updatePerson(Callback callback, int personId, String name, JSONObject metadata) {
        Instance().personDatabase().updatePerson(personId, name, metadata, createPersonDBCallback(callback, null));
    }

    private void deletePerson(Callback callback, int personId) {
        Instance().personDatabase().deletePerson(personId, createPersonDBCallback(callback, null));
    }

    private void getPersonImages(Callback callback, int personId) {
        Instance().personDatabase().getPersonImages(personId, createPersonDBPageableListCallback(callback, JSONConstructor::generatePersonImage));
    }

    private void getPersonImagesForPage(Callback callback, int personId, int page, int size) {
        Instance().personDatabase().getPersonImages(personId, page, size, createPersonDBPageableListCallback(callback, JSONConstructor::generatePersonImage));
    }

    private void addPersonImage(Callback callback, int personId, JSONObject image) {
        Instance().personDatabase().addPersonImage(personId, JSONConstructor.ImageUploadFromJSON(image), createPersonDBCallback(callback, JSONConstructor::generatePersonImage));
    }

    private void getPersonImage(Callback callback, int personId, int imageId) {
        Instance().personDatabase().getPersonImageById(personId, imageId, createPersonDBCallback(callback, JSONConstructor::generateByteArrayImage));
    }

    private void deletePersonImage(Callback callback, int personId, int imageId) {
        Instance().personDatabase().deletePersonImage(personId, imageId, createPersonDBCallback(callback, null));
    }

    private void getGroups(Callback callback) {
        Instance().personDatabase().getGroups(createPersonDBPageableListCallback(callback, JSONConstructor::generatePersonGroup));
    }

    private void getGroupsForPage(Callback callback, int page, int size) {
        Instance().personDatabase().getGroupsForPage(page, size, createPersonDBPageableListCallback(callback, JSONConstructor::generatePersonGroup));
    }

    private void getPersonGroups(Callback callback, int personId) {
        Instance().personDatabase().getPersonGroups(personId, createPersonDBPageableListCallback(callback, JSONConstructor::generatePersonGroup));
    }

    private void getPersonGroupsForPage(Callback callback, int personId, int page, int size) {
        Instance().personDatabase().getPersonGroups(personId, page, size, createPersonDBPageableListCallback(callback, JSONConstructor::generatePersonGroup));
    }

    private void createGroup(Callback callback, String name, JSONObject metadata) {
        Instance().personDatabase().createGroup(name, metadata, createPersonDBCallback(callback, JSONConstructor::generatePersonGroup));
    }

    private void getGroup(Callback callback, int groupId) {
        Instance().personDatabase().getGroup(groupId, createPersonDBCallback(callback, JSONConstructor::generatePersonGroup));
    }

    private void updateGroup(Callback callback, int groupId, String name, JSONObject metadata) {
        Instance().personDatabase().updateGroup(groupId, name, metadata, createPersonDBCallback(callback, null));
    }

    private void editPersonsInGroup(Callback callback, int groupId, JSONObject editGroupPersonsRequest) {
        Instance().personDatabase().editPersonsInGroup(groupId, JSONConstructor.EditGroupPersonsRequestFromJSON(editGroupPersonsRequest), createPersonDBCallback(callback, null));
    }

    private void getPersonsInGroup(Callback callback, int groupId) {
        Instance().personDatabase().getPersonsInGroup(groupId, createPersonDBPageableListCallback(callback, JSONConstructor::generatePerson));
    }

    private void getPersonsInGroupForPage(Callback callback, int groupId, int page, int size) {
        Instance().personDatabase().getPersonsInGroup(groupId, page, size, createPersonDBPageableListCallback(callback, JSONConstructor::generatePerson));
    }

    private void deleteGroup(Callback callback, int groupId) {
        Instance().personDatabase().deleteGroup(groupId, createPersonDBCallback(callback, null));
    }

    private void searchPerson(Callback callback, JSONObject searchPersonRequest) {
        Instance().personDatabase().searchPerson(JSONConstructor.SearchPersonRequestFromJSON(searchPersonRequest), createPersonDBListCallback(callback, JSONConstructor::generateSearchPerson));
    }
}