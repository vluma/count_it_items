# Flutter Wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }

# Keep Isar generated classes
-keep class com.example.count_it_items.data.models.** { *; }
-keep class **.isar.** { *; }

# Keep Freezed generated classes
-keep class **.freezed.** { *; }

# Keep JSON serialization
-keepattributes Signature
-keepattributes *Annotation*
-keep class **.g.** { *; }
