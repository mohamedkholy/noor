# Noor — AGENTS.md

## Commands

| What | How |
|------|-----|
| Run app | `flutter run` |
| Test | `flutter test` |
| Analyze | `flutter analyze` |
| Codegen (injectable, retrofit, drift, json) | `dart run build_runner build` |
| L10n codegen | `flutter gen-l10n` |

Run `flutter analyze` before committing; lint config is `package:flutter_lints/flutter.yaml` with extra strict rules (`prefer_const_constructors`, `avoid_dynamic_calls`, etc.).

## Architecture

Single Flutter app (not a monorepo). SDK `^3.8.1`, Flutter `>=3.35.0`.

### Layout
- `lib/core/` — shared infra: database, DI, helpers, models, networking, notifications, theming, routing, shared_prefs
- `lib/features/<name>/` — 20 feature modules, each split as `data/` (repos/models), `logic/` (cubits/states), `ui/` (screens/widgets)
- `lib/generated/` — l10n `.g.dart` (checked in)
- `lib/l10n/` — `intl_ar.arb`, `intl_en.arb` (Arabic & English)
- `assets/database/` — 5 pre-populated Drift `.db` files (quran, azkar, hadith, tasbih, cities)

### Key libraries
- **State**: flutter_bloc (BLoC)
- **DI**: GetIt + Injectable (codegen via `@injectable`, `@singleton`, `@module`)
- **DB**: Drift (SQLite) — databases are copied from `assets/database/` on first run
- **HTTP**: Dio + Retrofit (codegen via `@RestApi`)
- **Routing**: Custom `AppRouter` with `onGenerateRoute`, routes defined in `MyRoutes`
- **Notifications**: Firebase Cloud Messaging via `flutter_local_notifications`
- **Firebase**: core, crashlytics, analytics

### Entry point
`lib/main.dart` — initializes DI (`configureDependencies`), Firebase, Crashlytics, NotificationsManager, then pumps `MyApp` with `LanguageCubit` + `NavigationCubit` as root providers.

### Codegen quirks
- `.g.dart` files are **checked in** (injectable, drift, retrofit, json_serializable)
- After editing `@injectable`/`@RestApi`/`@DriftDatabase`/`@JsonSerializable` classes, run `dart run build_runner build`
- After editing `.arb` files, run `flutter gen-l10n`

## Testing

Only one file (`test/widget_test.dart`) exists — a stale counter smoke test. Any new test must be meaningful for the actual app. No CI/CD config found.

## Conventions
- **No comments in code** unless required by a lint
- Feature dirs keep `data/` → `repos/`, `logic/` → `<name>_cubit.dart` + `<name>_state.dart`, `ui/` → screens + optional `widgets/`
- Routes use `MyRoutes` constants, cubits provided per-route in `AppRouter`
- L10n class is `S` (`S.delegate`, `S.current`) from generated `lib/generated/l10n.dart`
- `Dio` is wired via `RegisterModule` with 30s timeouts
- Default city is Makkah (`Constants.defaultCity`)
