# todo_app
create project
flutter create --org com.google.todo_app todo_app

## git config
git init
git push public repo

## Flavors
flutter pub run flutter_flavorizr
flutter run --flavor dev -t lib/main_dev.dart

## Todo Model
flutter pub add freezed_annotation
flutter pub add dev:build_runner
flutter pub add dev:freezed
flutter pub add json_annotation
flutter pub add dev:json_serializable


## Riverpod
flutter pub add flutter_riverpod
flutter pub add riverpod_annotation
flutter pub add dev:riverpod_generator
flutter pub add dev:build_runner
flutter pub add dev:custom_lint
flutter pub add dev:riverpod_lint

## Firebase options

flutterfire config \
  --project=todo-app-a6832 \
  --out=lib/firebase_options_dev.dart \
  --ios-bundle-id=com.google.todoApp.dev \
  --android-app-id=com.google.todo_app_dev


flutter pub add firebase_core
update ios deployment target to 13

update jetbrains version in android/settings.gradle
id "org.jetbrains.kotlin.android" version "1.8.22" apply false





## Routing
flutter pub add go_router