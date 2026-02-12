# SoftFocus Mobile — Store Upload Guide (Phase D)

This document defines the exact steps
to build and upload SoftFocus Mobile
to Apple App Store and Google Play.

No product logic is defined here.

---

## Preconditions

- Phase D (Maintenance Mode)
- Mobile runtime validated:
  - Expo SDK 54
  - React Native 0.81.x
  - React 19.x
- Zero runtime errors on iOS and Android
- No pending governance violations

---

## Tooling

- Expo CLI
- EAS CLI
- Apple Developer Account
- Google Play Developer Account

---

## EAS Setup (One-time)

```bash
npm install -g eas-cli
eas login
eas init

iOS Build (App Store)
---------------------

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   eas build \    --platform ios \    --profile production   `

Output:

*   Signed .ipa
    
*   Uploaded automatically to App Store Connect (if configured)
    

Android Build (Google Play)
---------------------------

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   eas build \    --platform android \    --profile production   `

Output:

*   .aab bundle for Play Store upload
    

Store Upload
------------

### Apple App Store

*   Open App Store Connect
    
*   Select app → TestFlight / App Store
    
*   Attach build
    
*   Paste Review Notes (canonical)
    
*   Submit for review
    

### Google Play

*   Open Google Play Console
    
*   Internal testing or Production
    
*   Upload .aab
    
*   Complete Data Safety form
    
*   Submit for review
    

Phase D Constraints
-------------------

Allowed:

*   build
    
*   upload
    
*   metadata updates
    
*   review communication
    

Forbidden:

*   code changes
    
*   UI changes
    
*   logic changes
    
*   dependency changes
    

Any violation requires a new phase declaration.

