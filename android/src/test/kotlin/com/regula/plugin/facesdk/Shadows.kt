package com.regula.plugin.facesdk

import android.graphics.Bitmap
import android.graphics.drawable.BitmapDrawable
import android.graphics.drawable.Drawable
import org.robolectric.annotation.Implements

@Implements(Bitmap::class)
class MyShadowBitmap {
    var data: ByteArray? = null
}

@Implements(Drawable::class)
open class MyShadowDrawable {
    var data: ByteArray? = null
}

@Implements(BitmapDrawable::class)
class MyShadowBitmapDrawable : MyShadowDrawable()