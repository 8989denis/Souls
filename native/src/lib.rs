#[cfg(target_os = "android")]
use ui::App;

#[cfg(target_os = "android")]
#[unsafe(no_mangle)]
pub extern "C" fn Java_com_securesouls_souls_MainActivity_android_1main(
    mut _env: jni::JNIEnv,
    _class: jni::objects::JClass,
    _activity: jni::objects::JObject,
) {
    android_logger::init_once(
        android_logger::Config::default().with_max_level(log::LevelFilter::Info),
    );
    dioxus::launch(App);
}