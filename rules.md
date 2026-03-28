# 🌍 Localization Standards & Rules

To maintain high-quality support for **English (EN)** and **Arabic (AR)**, all developers must adhere to these strict localization protocols.

---

## 🚫 1. No Hardcoded Strings
**Rule:** User-facing text must **never** be written directly in Dart files.
* **Incorrect:** `Text("Login to your account")`
* **Correct:** `Text(AppLocalizations.of(context)!.loginTitle)`

> **Note:** This excludes internal keys (API endpoints, analytics event names, or shared preference keys) which should remain as constants and not be localized.

---

## 📂 2. ARB File Management
All strings must be managed within the `.arb` files located in `lib/l10n/`.

### Required Files
* `lib/l10n/app_en.arb` (Source - English)
* `lib/l10n/app_ar.arb` (Target - Arabic)

### Adding New Strings
1. **Define the Key:** Use **lowerCamelCase** for all keys (e.g., `splashWelcomeText`).
2. **Synchronize:** Every key added to `app_en.arb` **must** be added to `app_ar.arb` immediately.
3. **Context:** Provide a description in the English file for complex strings or those with placeholders.

**Example (`app_en.arb`):**
```json
{
  "searchPlaceholder": "Search products...",
  "@searchPlaceholder": {
    "description": "Hint text shown in the global search bar"
  }
}