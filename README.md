<div id="top">

<!-- HEADER STYLE: CLASSIC -->
<div align="center">

<img src="sistema_academico.png" width="30%" style="position: relative; top: 0; right: 0;" alt="Project Logo"/>

# SISTEMA_ACADEMICO

<em>Empowering Education Through Seamless Digital Innovation</em>

<!-- BADGES -->
<img src="https://img.shields.io/github/last-commit/Erik-egam/sistema_academico?style=flat&logo=git&logoColor=white&color=0080ff" alt="last-commit">
<img src="https://img.shields.io/github/languages/top/Erik-egam/sistema_academico?style=flat&color=0080ff" alt="repo-top-language">
<img src="https://img.shields.io/github/languages/count/Erik-egam/sistema_academico?style=flat&color=0080ff" alt="repo-language-count">

<em>Built with the tools and technologies:</em>

<img src="https://img.shields.io/badge/JSON-000000.svg?style=flat&logo=JSON&logoColor=white" alt="JSON">
<img src="https://img.shields.io/badge/Markdown-000000.svg?style=flat&logo=Markdown&logoColor=white" alt="Markdown">
<img src="https://img.shields.io/badge/Swift-F05138.svg?style=flat&logo=Swift&logoColor=white" alt="Swift">
<img src="https://img.shields.io/badge/Gradle-02303A.svg?style=flat&logo=Gradle&logoColor=white" alt="Gradle">
<img src="https://img.shields.io/badge/Dart-0175C2.svg?style=flat&logo=Dart&logoColor=white" alt="Dart">
<img src="https://img.shields.io/badge/C++-00599C.svg?style=flat&logo=C++&logoColor=white" alt="C++">
<br>
<img src="https://img.shields.io/badge/XML-005FAD.svg?style=flat&logo=XML&logoColor=white" alt="XML">
<img src="https://img.shields.io/badge/Flutter-02569B.svg?style=flat&logo=Flutter&logoColor=white" alt="Flutter">
<img src="https://img.shields.io/badge/CMake-064F8C.svg?style=flat&logo=CMake&logoColor=white" alt="CMake">
<img src="https://img.shields.io/badge/Kotlin-7F52FF.svg?style=flat&logo=Kotlin&logoColor=white" alt="Kotlin">
<img src="https://img.shields.io/badge/YAML-CB171E.svg?style=flat&logo=YAML&logoColor=white" alt="YAML">

</div>
<br>

---

## 📄 Table of Contents

- [Overview](#-overview)
- [Getting Started](#-getting-started)
    - [Prerequisites](#-prerequisites)
    - [Installation](#-installation)
    - [Usage](#-usage)
    - [Testing](#-testing)
- [Features](#-features)
- [Project Structure](#-project-structure)
    - [Project Index](#-project-index)
- [Roadmap](#-roadmap)
- [Acknowledgment](#-acknowledgment)

---

## ✨ Overview

sistema_academico is a Flutter-based academic management system designed to operate seamlessly across Android, iOS, Web, Windows, Linux, and macOS. It provides a modular architecture with clear separation of models, screens, and services, enabling scalable and maintainable development. The project integrates with backend APIs for user authentication, program management, and secure data storage, ensuring a secure and efficient user experience.

**Why sistema_academico?**

This project empowers developers to build robust, cross-platform educational solutions with ease. The core features include:

- 🎯 **🔧 Multi-platform support:** Target Android, iOS, Web, Windows, Linux, and macOS with a unified codebase.
- 🚀 **📱 Modular architecture:** Organized separation of models, screens, and routing for scalable development.
- 🔒 **🛡️ Secure data handling:** Integration with Flutter Secure Storage and security best practices.
- 💻 **🧪 Code quality:** Static analysis and Flutter linting rules to maintain high standards.
- 🌐 **🔗 Backend integration:** Comprehensive API services for user, program, and academic data management.
- 🧭 **🗺️ Advanced routing:** Seamless navigation architecture supporting complex user flows.

---

## 📌 Features

|      | Component       | Details                                                                                     |
| :--- | :-------------- | :------------------------------------------------------------------------------------------ |
| ⚙️  | **Architecture**  | <ul><li>Multi-language stack: Kotlin (Android), Dart (Flutter), C++ (native modules), Swift (iOS)</li><li>Modular project structure with separate CMakeLists for platform-specific builds</li><li>Flutter frontend with native integrations</li></ul> |
| 🔩 | **Code Quality**  | <ul><li>Uses analysis_options.yaml for static analysis</li><li>Consistent code organization across Kotlin, Dart, C++, Swift</li><li>Adheres to language-specific best practices</li></ul> |
| 📄 | **Documentation** | <ul><li>Includes README, manifest files, and comments in code</li><li>Contains configuration files like analysis_options.yaml, pubspec.yaml</li><li>Limited external documentation; primarily inline and config files</li></ul> |
| 🔌 | **Integrations**  | <ul><li>Build tools: Gradle (Android), CMake (native modules), pub (Dart/Flutter)</li><li>Platform-specific manifests: AndroidManifest.xml, Info.plist (implied)</li><li>CI/CD tools: pub, gradle, cmake, flutter commands</li></ul> |
| 🧩 | **Modularity**    | <ul><li>Separate modules for native code (C++, Swift), Flutter, and platform-specific configs</li><li>Native code organized into directories with dedicated CMakeLists</li><li>Flutter plugins and packages managed via pubspec.yaml</li></ul> |
| 🧪 | **Testing**       | <ul><li>Implicit: Use of pubspec.lock suggests dependency management for testing packages</li><li>Native code likely tested via CMake/Native testing frameworks</li><li>Limited explicit test files indicated in the codebase</li></ul> |
| ⚡️  | **Performance**   | <ul><li>Native modules in C++ for performance-critical parts</li><li>Use of CMake for optimized native builds</li><li>Flutter rendering optimized via platform channels</li></ul> |
| 🛡️ | **Security**      | <ul><li>Platform-specific entitlements and manifest files for security policies</li><li>Native code includes entitlements files (release.entitlements, debugprofile.entitlements)</li><li>Secure communication likely via platform channels</li></ul> |
| 📦 | **Dependencies**  | <ul><li>Package management via pubspec.yaml and pubspec.lock for Dart</li><li>Native dependencies managed via CMake and platform-specific build files</li><li>Gradle build scripts for Android dependencies</li></ul> |

---

## 📁 Project Structure

```sh
└── sistema_academico/
    ├── README.md
    ├── analysis_options.yaml
    ├── android
    │   ├── .gitignore
    │   ├── app
    │   ├── build.gradle.kts
    │   ├── gradle
    │   ├── gradle.properties
    │   └── settings.gradle.kts
    ├── ios
    │   ├── .gitignore
    │   ├── Flutter
    │   ├── Runner
    │   ├── Runner.xcodeproj
    │   ├── Runner.xcworkspace
    │   └── RunnerTests
    ├── lib
    │   ├── main.dart
    │   ├── menu
    │   ├── models
    │   ├── routers
    │   ├── screens
    │   ├── services
    │   └── theme
    ├── linux
    │   ├── .gitignore
    │   ├── CMakeLists.txt
    │   ├── flutter
    │   └── runner
    ├── macos
    │   ├── .gitignore
    │   ├── Flutter
    │   ├── Runner
    │   ├── Runner.xcodeproj
    │   ├── Runner.xcworkspace
    │   └── RunnerTests
    ├── pubspec.lock
    ├── pubspec.yaml
    ├── web
    │   ├── favicon.png
    │   ├── icons
    │   ├── index.html
    │   └── manifest.json
    └── windows
        ├── .gitignore
        ├── CMakeLists.txt
        ├── flutter
        └── runner
```

---

### 📑 Project Index

<details open>
	<summary><b><code>SISTEMA_ACADEMICO/</code></b></summary>
	<!-- __root__ Submodule -->
	<details>
		<summary><b>__root__</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ __root__</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/analysis_options.yaml'>analysis_options.yaml</a></b></td>
					<td style='padding: 8px;'>- Defines the projects static analysis configuration by including Flutter-specific linting rules, ensuring code quality and consistency across the Flutter codebase<br>- It integrates standard best practices from the Flutter community, guiding developers to write clean, maintainable, and error-free code within the overall project architecture.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/README.md'>README.md</a></b></td>
					<td style='padding: 8px;'>- Provides an overview of the Flutter-based academic management system, outlining its core functionality for managing educational processes within the project<br>- Serves as the foundational documentation, guiding users and developers on the purpose of the application, which is to facilitate streamlined academic operations through a mobile interface<br>- Ensures clarity on the projects scope within the overall architecture.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/pubspec.yaml'>pubspec.yaml</a></b></td>
					<td style='padding: 8px;'>- Defines project metadata, dependencies, and environment settings for the Flutter-based academic management system<br>- Facilitates integration of core libraries such as Dio for networking, Flutter Secure Storage for data security, and go_router for navigation, ensuring a structured foundation for building and maintaining the applications features and architecture.</td>
				</tr>
			</table>
		</blockquote>
	</details>
	<!-- android Submodule -->
	<details>
		<summary><b>android</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ android</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/android/settings.gradle.kts'>settings.gradle.kts</a></b></td>
					<td style='padding: 8px;'>- Defines plugin management and build configuration for the Android project, integrating Flutter SDK components and essential plugins<br>- Facilitates consistent setup across development environments by dynamically locating the Flutter SDK path and including necessary build scripts<br>- Ensures proper plugin registration and project structure alignment within the overall architecture, supporting seamless Flutter and Android integration.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/android/build.gradle.kts'>build.gradle.kts</a></b></td>
					<td style='padding: 8px;'>- Defines the build configuration for the Android project, establishing repository sources and managing build directories across subprojects<br>- It ensures consistent build output locations, facilitates project cleanup, and maintains dependencies, supporting a streamlined and organized build process within the overall architecture.</td>
				</tr>
			</table>
			<!-- app Submodule -->
			<details>
				<summary><b>app</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ android.app</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/android/app/build.gradle.kts'>build.gradle.kts</a></b></td>
							<td style='padding: 8px;'>- Defines the Android build configuration for the application, specifying SDK versions, application ID, build types, and plugin integrations<br>- Ensures proper setup for compiling, targeting, and packaging the Android app within the Flutter project architecture, facilitating seamless integration between Flutter and native Android components.</td>
						</tr>
					</table>
					<!-- src Submodule -->
					<details>
						<summary><b>src</b></summary>
						<blockquote>
							<div class='directory-path' style='padding: 8px 0; color: #666;'>
								<code><b>⦿ android.app.src</b></code>
							<!-- debug Submodule -->
							<details>
								<summary><b>debug</b></summary>
								<blockquote>
									<div class='directory-path' style='padding: 8px 0; color: #666;'>
										<code><b>⦿ android.app.src.debug</b></code>
									<table style='width: 100%; border-collapse: collapse;'>
									<thead>
										<tr style='background-color: #f8f9fa;'>
											<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
											<th style='text-align: left; padding: 8px;'>Summary</th>
										</tr>
									</thead>
										<tr style='border-bottom: 1px solid #eee;'>
											<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/android/app/src/debug/AndroidManifest.xml'>AndroidManifest.xml</a></b></td>
											<td style='padding: 8px;'>- Defines the necessary internet permission for development purposes, enabling communication between the Flutter tool and the application during debugging, hot reload, and other development activities<br>- This setup ensures smooth interaction with the app in a development environment, supporting efficient testing and troubleshooting within the overall Android app architecture.</td>
										</tr>
									</table>
								</blockquote>
							</details>
							<!-- profile Submodule -->
							<details>
								<summary><b>profile</b></summary>
								<blockquote>
									<div class='directory-path' style='padding: 8px 0; color: #666;'>
										<code><b>⦿ android.app.src.profile</b></code>
									<table style='width: 100%; border-collapse: collapse;'>
									<thead>
										<tr style='background-color: #f8f9fa;'>
											<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
											<th style='text-align: left; padding: 8px;'>Summary</th>
										</tr>
									</thead>
										<tr style='border-bottom: 1px solid #eee;'>
											<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/android/app/src/profile/AndroidManifest.xml'>AndroidManifest.xml</a></b></td>
											<td style='padding: 8px;'>- Defines the necessary permissions for development and debugging activities within the Android environment, specifically enabling internet access required for Flutters hot reload, breakpoints, and communication with the running application<br>- It ensures the development tools can interact seamlessly with the app during the development process, supporting efficient testing and debugging workflows within the overall project architecture.</td>
										</tr>
									</table>
								</blockquote>
							</details>
							<!-- main Submodule -->
							<details>
								<summary><b>main</b></summary>
								<blockquote>
									<div class='directory-path' style='padding: 8px 0; color: #666;'>
										<code><b>⦿ android.app.src.main</b></code>
									<table style='width: 100%; border-collapse: collapse;'>
									<thead>
										<tr style='background-color: #f8f9fa;'>
											<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
											<th style='text-align: left; padding: 8px;'>Summary</th>
										</tr>
									</thead>
										<tr style='border-bottom: 1px solid #eee;'>
											<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/android/app/src/main/AndroidManifest.xml'>AndroidManifest.xml</a></b></td>
											<td style='padding: 8px;'>- Defines the main application configuration for the Android platform within the Flutter project, establishing the apps entry point, theme, and intent filters<br>- Facilitates seamless integration of Flutter UI with native Android components, ensuring proper launch behavior, theme application, and text processing capabilities aligned with the overall architecture.</td>
										</tr>
									</table>
									<!-- kotlin Submodule -->
									<details>
										<summary><b>kotlin</b></summary>
										<blockquote>
											<div class='directory-path' style='padding: 8px 0; color: #666;'>
												<code><b>⦿ android.app.src.main.kotlin</b></code>
											<!-- com Submodule -->
											<details>
												<summary><b>com</b></summary>
												<blockquote>
													<div class='directory-path' style='padding: 8px 0; color: #666;'>
														<code><b>⦿ android.app.src.main.kotlin.com</b></code>
													<!-- example Submodule -->
													<details>
														<summary><b>example</b></summary>
														<blockquote>
															<div class='directory-path' style='padding: 8px 0; color: #666;'>
																<code><b>⦿ android.app.src.main.kotlin.com.example</b></code>
															<!-- sistema_academico Submodule -->
															<details>
																<summary><b>sistema_academico</b></summary>
																<blockquote>
																	<div class='directory-path' style='padding: 8px 0; color: #666;'>
																		<code><b>⦿ android.app.src.main.kotlin.com.example.sistema_academico</b></code>
																	<table style='width: 100%; border-collapse: collapse;'>
																	<thead>
																		<tr style='background-color: #f8f9fa;'>
																			<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
																			<th style='text-align: left; padding: 8px;'>Summary</th>
																		</tr>
																	</thead>
																		<tr style='border-bottom: 1px solid #eee;'>
																			<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/android/app/src/main/kotlin/com/example/sistema_academico/MainActivity.kt'>MainActivity.kt</a></b></td>
																			<td style='padding: 8px;'>- Defines the main entry point for the Android application within the Flutter framework, enabling seamless integration of Flutters UI components with native Android functionalities<br>- Serves as the bridge that launches the app on Android devices, ensuring proper initialization and communication between Flutter and the underlying Android platform in the overall project architecture.</td>
																		</tr>
																	</table>
																</blockquote>
															</details>
														</blockquote>
													</details>
												</blockquote>
											</details>
										</blockquote>
									</details>
								</blockquote>
							</details>
						</blockquote>
					</details>
				</blockquote>
			</details>
		</blockquote>
	</details>
	<!-- windows Submodule -->
	<details>
		<summary><b>windows</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ windows</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/windows/CMakeLists.txt'>CMakeLists.txt</a></b></td>
					<td style='padding: 8px;'>- Defines the build configuration and installation process for a Windows-based C++ application utilizing Flutter<br>- It orchestrates compilation settings, manages dependencies, and ensures proper placement of runtime assets, including Flutter libraries and plugins, facilitating seamless deployment and execution within the project’s architecture.</td>
				</tr>
			</table>
			<!-- runner Submodule -->
			<details>
				<summary><b>runner</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ windows.runner</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/windows/runner/win32_window.h'>win32_window.h</a></b></td>
							<td style='padding: 8px;'>- Defines a high DPI-aware Win32 window abstraction to facilitate creation, display, and management of native Windows UI elements<br>- It enables subclasses to customize rendering and input handling, manages window lifecycle events, and ensures consistent behavior across different DPI settings, forming a core component for building platform-specific user interfaces within the overall architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/windows/runner/CMakeLists.txt'>CMakeLists.txt</a></b></td>
							<td style='padding: 8px;'>- Defines the build configuration for the Windows runner executable, orchestrating compilation, linking, and dependency management within the overall Flutter-based architecture<br>- It ensures the application is correctly assembled with versioning, platform-specific settings, and necessary libraries, facilitating seamless integration of Flutter components into the Windows environment.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/windows/runner/runner.exe.manifest'>runner.exe.manifest</a></b></td>
							<td style='padding: 8px;'>- Defines the application manifest for the Windows runner executable, specifying DPI awareness and OS compatibility settings<br>- Ensures the runner operates correctly across Windows 10 and 11 by configuring display scaling behavior and supporting the targeted operating systems within the overall architecture<br>- This setup promotes consistent user experience and system integration for the application.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/windows/runner/main.cpp'>main.cpp</a></b></td>
							<td style='padding: 8px;'>- Initializes and manages the Windows application window for a Flutter-based desktop app, establishing the main event loop and integrating Dart runtime<br>- Facilitates launching the user interface with specified parameters, ensuring proper message handling and resource cleanup, thereby serving as the entry point that connects the Flutter engine with the Windows operating system within the overall architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/windows/runner/flutter_window.cpp'>flutter_window.cpp</a></b></td>
							<td style='padding: 8px;'>- Facilitates the creation and management of a native Windows window integrated with Flutter, enabling seamless rendering of Flutter content within a Windows environment<br>- Handles window lifecycle events, manages the Flutter engine and view, registers plugins, and processes window messages to ensure smooth operation and interaction between Windows and Flutter components within the applications architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/windows/runner/win32_window.cpp'>win32_window.cpp</a></b></td>
							<td style='padding: 8px;'>- Implements a Win32 window management system within the Flutter Windows embedding, handling window creation, theming, DPI scaling, and message processing<br>- Facilitates seamless window lifecycle management, theme adaptation (including dark mode support), and DPI awareness, ensuring consistent and responsive user interface behavior aligned with Windows OS standards across the applications architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/windows/runner/flutter_window.h'>flutter_window.h</a></b></td>
							<td style='padding: 8px;'>- Defines a Flutter window within a Windows environment, serving as a container that hosts and manages a Flutter view<br>- Facilitates integration of Flutter UI components into native Windows applications by initializing and controlling the lifecycle of the embedded Flutter engine and view<br>- Acts as a bridge between Windows window management and Flutter rendering, ensuring seamless UI rendering and interaction.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/windows/runner/resource.h'>resource.h</a></b></td>
							<td style='padding: 8px;'>- Defines application resource identifiers for the Windows runner, including the application icon<br>- Facilitates consistent referencing of visual assets and UI elements within the Windows build environment, supporting the overall architecture by enabling proper resource management and integration for the runner component<br>- Ensures streamlined resource handling across the Windows platform in the project.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/windows/runner/Runner.rc'>Runner.rc</a></b></td>
							<td style='padding: 8px;'>- Defines application metadata, icons, and version information for the Windows build of the system<br>- Facilitates consistent branding and versioning across the application, ensuring proper identification and integration within the Windows environment<br>- Serves as a foundational resource for the executable, supporting system recognition and user interface consistency within the overall architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/windows/runner/utils.cpp'>utils.cpp</a></b></td>
							<td style='padding: 8px;'>- Facilitates Windows-specific runtime support by creating and attaching a console for debugging and output visibility<br>- Manages command-line argument parsing by converting UTF-16 inputs to UTF-8, ensuring proper data handling within the Flutter engine<br>- Enhances cross-platform compatibility and streamlines startup processes within the overall architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/windows/runner/utils.h'>utils.h</a></b></td>
							<td style='padding: 8px;'>- Provides utility functions to facilitate Windows process management and command-line handling within the project<br>- It enables creating console windows with redirected output streams and converting command-line arguments between UTF-16 and UTF-8 encodings<br>- These utilities support seamless integration of Windows-specific features, ensuring proper process interaction and argument parsing across the applications architecture.</td>
						</tr>
					</table>
				</blockquote>
			</details>
			<!-- flutter Submodule -->
			<details>
				<summary><b>flutter</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ windows.flutter</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/windows/flutter/CMakeLists.txt'>CMakeLists.txt</a></b></td>
							<td style='padding: 8px;'>- Defines the build process for integrating Flutters Windows SDK into the project, orchestrating the compilation of core, plugin, and application wrapper components<br>- Ensures proper linkage of Flutter libraries and resources, facilitating seamless embedding of Flutter UI within the Windows environment while maintaining modularity and build consistency across the codebase.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/windows/flutter/generated_plugins.cmake'>generated_plugins.cmake</a></b></td>
							<td style='padding: 8px;'>- Defines the integration of Flutter plugins for Windows within the build system, ensuring proper linkage and inclusion of plugin libraries<br>- Facilitates seamless incorporation of platform-specific functionalities, such as secure storage, by dynamically managing plugin dependencies during the build process, thereby supporting the overall architectures modularity and extensibility.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/windows/flutter/generated_plugin_registrant.cc'>generated_plugin_registrant.cc</a></b></td>
							<td style='padding: 8px;'>- Registers platform-specific plugins for Windows within the Flutter application, enabling seamless integration of native functionalities<br>- Ensures that the FlutterSecureStorage plugin is properly initialized and available for secure data storage operations on Windows<br>- This component is essential for maintaining consistent plugin registration across the app’s architecture, facilitating secure and reliable plugin management during runtime.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/windows/flutter/generated_plugin_registrant.h'>generated_plugin_registrant.h</a></b></td>
							<td style='padding: 8px;'>- Facilitates the registration of Flutter plugins within the Windows platform, ensuring seamless integration of native functionalities into the Flutter application<br>- Serves as a crucial component in the plugin initialization process, enabling the Flutter engine to recognize and utilize platform-specific plugins during app startup<br>- Supports the overall architecture by maintaining organized plugin management across the Windows environment.</td>
						</tr>
					</table>
				</blockquote>
			</details>
		</blockquote>
	</details>
	<!-- web Submodule -->
	<details>
		<summary><b>web</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ web</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/web/index.html'>index.html</a></b></td>
					<td style='padding: 8px;'>- Defines the entry point for the web application, setting up the HTML structure and metadata necessary for proper rendering and device compatibility<br>- It ensures the Flutter-based frontend loads correctly within various hosting environments, facilitating seamless user access and interaction with the overall system architecture.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/web/manifest.json'>manifest.json</a></b></td>
					<td style='padding: 8px;'>- Defines the web applications metadata and visual identity for the Flutter-based academic system<br>- It ensures proper app branding, icons, and launch behavior across devices, supporting a seamless user experience when accessing the platform through web browsers<br>- This configuration integrates the web interface into the overall architecture, facilitating consistent branding and functionality.</td>
				</tr>
			</table>
		</blockquote>
	</details>
	<!-- linux Submodule -->
	<details>
		<summary><b>linux</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ linux</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/linux/CMakeLists.txt'>CMakeLists.txt</a></b></td>
					<td style='padding: 8px;'>- Defines the build configuration and project structure for a cross-platform desktop application utilizing Flutter and GTK<br>- Orchestrates compilation settings, manages dependencies, and facilitates bundling and installation processes to ensure a consistent, relocatable executable with integrated Flutter assets and native libraries within the overall architecture.</td>
				</tr>
			</table>
			<!-- runner Submodule -->
			<details>
				<summary><b>runner</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ linux.runner</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/linux/runner/CMakeLists.txt'>CMakeLists.txt</a></b></td>
							<td style='padding: 8px;'>- Defines the build configuration for the Linux runner application, specifying source files, dependencies, and build settings<br>- It orchestrates the compilation and linking process to produce the executable, integrating Flutter and GTK components to enable a desktop environment for the project<br>- This setup ensures consistent and efficient construction of the Linux-specific application component within the overall architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/linux/runner/my_application.cc'>my_application.cc</a></b></td>
							<td style='padding: 8px;'>- Defines the main application structure and lifecycle for a Flutter-based Linux desktop app, managing window creation, platform-specific UI adjustments, and plugin registration<br>- Facilitates seamless startup, activation, and shutdown processes, ensuring proper integration with desktop environments like GNOME and Wayland, while orchestrating the Flutter rendering view within a GTK window.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/linux/runner/main.cc'>main.cc</a></b></td>
							<td style='padding: 8px;'>- Initialize and launch the application within the Linux environment, serving as the entry point for executing the software<br>- It sets up the main application object and manages the applications lifecycle, ensuring proper startup and shutdown procedures in alignment with the overall architecture<br>- This core component facilitates seamless integration and operation of the application across the system.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/linux/runner/my_application.h'>my_application.h</a></b></td>
							<td style='padding: 8px;'>- Defines the core application class for a Flutter-based desktop environment, facilitating integration with GTK<br>- It establishes a final application type that manages the lifecycle and initialization of the Flutter application within a Linux GTK context, serving as the foundational component for launching and controlling the apps user interface and runtime behavior.</td>
						</tr>
					</table>
				</blockquote>
			</details>
			<!-- flutter Submodule -->
			<details>
				<summary><b>flutter</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ linux.flutter</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/linux/flutter/CMakeLists.txt'>CMakeLists.txt</a></b></td>
							<td style='padding: 8px;'>- Defines the build process for integrating Flutters Linux library into the project, managing dependencies, configurations, and compilation steps<br>- Ensures that Flutters core components and platform-specific assets are correctly assembled and linked, facilitating seamless embedding of Flutter UI within the Linux environment as part of the overall architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/linux/flutter/generated_plugins.cmake'>generated_plugins.cmake</a></b></td>
							<td style='padding: 8px;'>- Manages the integration of Flutter plugins for Linux by dynamically including plugin directories and linking their libraries to the main application<br>- Facilitates seamless plugin loading and dependency management, ensuring that platform-specific functionalities such as secure storage are properly incorporated into the overall architecture<br>- Supports modular extension and maintainability within the Flutter Linux project.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/linux/flutter/generated_plugin_registrant.cc'>generated_plugin_registrant.cc</a></b></td>
							<td style='padding: 8px;'>- Registers the FlutterSecureStorageLinuxPlugin within the Linux platform, enabling secure storage functionalities<br>- It integrates the plugin into the Flutter applications plugin registry, ensuring secure data handling capabilities are available on Linux environments as part of the overall cross-platform architecture<br>- This facilitates consistent secure storage behavior across supported platforms.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/linux/flutter/generated_plugin_registrant.h'>generated_plugin_registrant.h</a></b></td>
							<td style='padding: 8px;'>- Facilitates the registration of Flutter plugins within the Linux platform, ensuring seamless integration of native functionalities into the Flutter application<br>- Serves as a crucial component in the plugin management architecture, enabling the dynamic loading and initialization of plugins to extend app capabilities on Linux environments.</td>
						</tr>
					</table>
				</blockquote>
			</details>
		</blockquote>
	</details>
	<!-- lib Submodule -->
	<details>
		<summary><b>lib</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ lib</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/lib/main.dart'>main.dart</a></b></td>
					<td style='padding: 8px;'>- Sets up the core application entry point, initializing the Flutter app with routing and theming configurations<br>- It orchestrates the overall architecture by integrating navigation through a router and applying a consistent visual style, serving as the foundational component that enables seamless user interaction within the academic management system.</td>
				</tr>
			</table>
			<!-- routers Submodule -->
			<details>
				<summary><b>routers</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ lib.routers</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/lib/routers/app_routes.dart'>app_routes.dart</a></b></td>
							<td style='padding: 8px;'>- Defines the applications routing architecture, orchestrating navigation across administrative, student, and teacher interfaces<br>- Facilitates seamless transitions between screens, manages route parameters, and ensures proper context passing, thereby supporting the overall structure and user flow within the system<br>- This routing configuration is central to the apps navigation logic and user experience.</td>
						</tr>
					</table>
				</blockquote>
			</details>
			<!-- models Submodule -->
			<details>
				<summary><b>models</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ lib.models</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/lib/models/info_semestre.dart'>info_semestre.dart</a></b></td>
							<td style='padding: 8px;'>- Defines the data model for academic semester information, encapsulating key attributes such as identifier, name, start date, and end date<br>- Facilitates structured handling and serialization of semester data within the broader application architecture, supporting features like scheduling, reporting, and semester-specific operations<br>- Ensures consistent data representation aligned with backend JSON responses.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/lib/models/info_nota.dart'>info_nota.dart</a></b></td>
							<td style='padding: 8px;'>- Defines the data model for student grades and attendance, encapsulating subject-specific information<br>- Facilitates structured handling of academic records within the application, enabling seamless data parsing and integration across the systems architecture<br>- This core component supports features related to academic performance tracking and reporting.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/lib/models/info_programa.dart'>info_programa.dart</a></b></td>
							<td style='padding: 8px;'>- Defines the data model for program information within the application, encapsulating core attributes such as name, description, and identifier<br>- Facilitates structured handling and serialization of program data, enabling seamless integration and consistent data representation across the codebase<br>- Serves as a foundational component for managing program-related information within the overall architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/lib/models/info_usuario.dart'>info_usuario.dart</a></b></td>
							<td style='padding: 8px;'>- Defines the user information model within the application, encapsulating essential user attributes such as identification, name, email, role, and status<br>- Facilitates structured data handling and seamless integration of user data across the system, supporting features like user management, authentication, and authorization within the overall architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/lib/models/info_asignatura.dart'>info_asignatura.dart</a></b></td>
							<td style='padding: 8px;'>- Defines the data model for academic course information within the application, encapsulating key attributes such as course ID, name, code, credits, and associated program ID<br>- Facilitates structured handling and serialization of course data, enabling seamless integration and manipulation across the broader system architecture<br>- This model supports consistent data representation throughout the project’s educational management features.</td>
						</tr>
					</table>
				</blockquote>
			</details>
			<!-- theme Submodule -->
			<details>
				<summary><b>theme</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ lib.theme</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/lib/theme/app_theme.dart'>app_theme.dart</a></b></td>
							<td style='padding: 8px;'>- Defines the applications visual theme by selecting a color scheme and configuring Material Design settings<br>- Facilitates consistent styling across the app, enabling easy customization of appearance through color selection<br>- Serves as a central point for theme management, ensuring a cohesive user interface aligned with the overall design architecture.</td>
						</tr>
					</table>
				</blockquote>
			</details>
			<!-- screens Submodule -->
			<details>
				<summary><b>screens</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ lib.screens</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/lib/screens/login_screen.dart'>login_screen.dart</a></b></td>
							<td style='padding: 8px;'>- Facilitates user authentication within the academic system by providing a login interface that verifies credentials and redirects users based on their roles (admin, student, or teacher)<br>- Serves as the entry point for secure access, integrating role-based navigation to ensure users are directed to appropriate dashboards aligned with their permissions.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/lib/screens/screens.dart'>screens.dart</a></b></td>
							<td style='padding: 8px;'>- Centralizes the export of all screen components within the project, facilitating streamlined access and improved modularity across the codebase<br>- By aggregating screen imports, it simplifies navigation and management of the user interface layers, supporting scalable development and maintainability of the applications architecture.</td>
						</tr>
					</table>
					<!-- admin Submodule -->
					<details>
						<summary><b>admin</b></summary>
						<blockquote>
							<div class='directory-path' style='padding: 8px 0; color: #666;'>
								<code><b>⦿ lib.screens.admin</b></code>
							<table style='width: 100%; border-collapse: collapse;'>
							<thead>
								<tr style='background-color: #f8f9fa;'>
									<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
									<th style='text-align: left; padding: 8px;'>Summary</th>
								</tr>
							</thead>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/lib/screens/admin/admin_programas_screen.dart'>admin_programas_screen.dart</a></b></td>
									<td style='padding: 8px;'>- Provides an administrative interface for managing academic programs, enabling users to view, create, and navigate through program details<br>- Integrates with backend services to fetch program data dynamically and offers seamless navigation for editing or adding new programs within the overall application architecture<br>- Facilitates efficient program management in the systems administrative module.</td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/lib/screens/admin/admin_programa_screen.dart'>admin_programa_screen.dart</a></b></td>
									<td style='padding: 8px;'>- Provides an administrative interface for managing program details within the application<br>- It displays a list of menu options tailored to a specific program, enabling navigation to various administrative functionalities<br>- Integrates with the overall app architecture to facilitate user interactions and streamline program management tasks.</td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/lib/screens/admin/admin_screen.dart'>admin_screen.dart</a></b></td>
									<td style='padding: 8px;'>- Provides the administrative interface within the application, enabling users to navigate and access various management functions through a structured menu<br>- It integrates with the overall architecture by offering a centralized control panel, facilitating efficient access to admin features and streamlining user interactions within the admin section of the platform.</td>
								</tr>
							</table>
							<!-- semestre Submodule -->
							<details>
								<summary><b>semestre</b></summary>
								<blockquote>
									<div class='directory-path' style='padding: 8px 0; color: #666;'>
										<code><b>⦿ lib.screens.admin.semestre</b></code>
									<table style='width: 100%; border-collapse: collapse;'>
									<thead>
										<tr style='background-color: #f8f9fa;'>
											<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
											<th style='text-align: left; padding: 8px;'>Summary</th>
										</tr>
									</thead>
										<tr style='border-bottom: 1px solid #eee;'>
											<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/lib/screens/admin/semestre/admin_semestres.dart'>admin_semestres.dart</a></b></td>
											<td style='padding: 8px;'>- Facilitates the creation of academic semesters by enabling users to select start and end dates, automatically generating semester identifiers based on the start date, and submitting this data to the backend API<br>- Integrates user interface elements for date selection and feedback, supporting administrative workflows within the broader academic management system.</td>
										</tr>
									</table>
								</blockquote>
							</details>
							<!-- programa Submodule -->
							<details>
								<summary><b>programa</b></summary>
								<blockquote>
									<div class='directory-path' style='padding: 8px 0; color: #666;'>
										<code><b>⦿ lib.screens.admin.programa</b></code>
									<table style='width: 100%; border-collapse: collapse;'>
									<thead>
										<tr style='background-color: #f8f9fa;'>
											<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
											<th style='text-align: left; padding: 8px;'>Summary</th>
										</tr>
									</thead>
										<tr style='border-bottom: 1px solid #eee;'>
											<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/lib/screens/admin/programa/admin_profesores_screen.dart'>admin_profesores_screen.dart</a></b></td>
											<td style='padding: 8px;'>- Facilitates administration of professors within a program by enabling viewing, activation/deactivation, assignment to subjects, and creation of new professors<br>- Integrates user management with program-specific data, supporting dynamic updates and detailed views of assigned subjects, thereby streamlining academic staff management in the overall application architecture.</td>
										</tr>
										<tr style='border-bottom: 1px solid #eee;'>
											<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/lib/screens/admin/programa/admin_crear_programa.dart'>admin_crear_programa.dart</a></b></td>
											<td style='padding: 8px;'>- Facilitates the creation of new academic programs within the application by providing a user interface for inputting program details and handling form validation<br>- Integrates with the backend API to persist data, ensuring seamless addition of programs to the system<br>- Supports user feedback and navigation flow, contributing to the administrative management features of the overall architecture.</td>
										</tr>
										<tr style='border-bottom: 1px solid #eee;'>
											<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/lib/screens/admin/programa/admin_estudiantes_screen.dart'>admin_estudiantes_screen.dart</a></b></td>
											<td style='padding: 8px;'>- Facilitates administration of students within a program by enabling viewing, activation/deactivation, and registration of new students<br>- Integrates with backend services to fetch student data, manage user statuses, and handle student creation, supporting efficient program management and user lifecycle control in the overall application architecture.</td>
										</tr>
										<tr style='border-bottom: 1px solid #eee;'>
											<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/lib/screens/admin/programa/admin_asignaturas_screen.dart'>admin_asignaturas_screen.dart</a></b></td>
											<td style='padding: 8px;'>- Facilitates the management of academic subjects within a program by displaying current offerings, enabling the addition of new subjects, and toggling their activation status<br>- Integrates with backend services to fetch, create, and update subject data, supporting administrative workflows for curriculum configuration and ensuring dynamic, real-time updates in the user interface.</td>
										</tr>
									</table>
								</blockquote>
							</details>
						</blockquote>
					</details>
					<!-- teacher Submodule -->
					<details>
						<summary><b>teacher</b></summary>
						<blockquote>
							<div class='directory-path' style='padding: 8px 0; color: #666;'>
								<code><b>⦿ lib.screens.teacher</b></code>
							<table style='width: 100%; border-collapse: collapse;'>
							<thead>
								<tr style='background-color: #f8f9fa;'>
									<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
									<th style='text-align: left; padding: 8px;'>Summary</th>
								</tr>
							</thead>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/lib/screens/teacher/profesor_asignatura_screen.dart'>profesor_asignatura_screen.dart</a></b></td>
									<td style='padding: 8px;'>- Manages the display and interaction of a teachers detailed view of a specific subject, including listing enrolled students and enabling profile review and grade management<br>- Facilitates real-time data fetching, editing, and saving of student academic records, integrating seamlessly into the broader educational platform architecture.</td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/lib/screens/teacher/profesor_asignaturas_screen.dart'>profesor_asignaturas_screen.dart</a></b></td>
									<td style='padding: 8px;'>- Displays a teachers assigned subjects, enabling easy access and management within the educational platform<br>- It fetches and presents the list of subjects the professor teaches, allowing navigation to detailed views<br>- Integrates seamlessly into the overall architecture by providing a user interface for instructors to monitor and interact with their course assignments.</td>
								</tr>
							</table>
						</blockquote>
					</details>
					<!-- student Submodule -->
					<details>
						<summary><b>student</b></summary>
						<blockquote>
							<div class='directory-path' style='padding: 8px 0; color: #666;'>
								<code><b>⦿ lib.screens.student</b></code>
							<table style='width: 100%; border-collapse: collapse;'>
							<thead>
								<tr style='background-color: #f8f9fa;'>
									<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
									<th style='text-align: left; padding: 8px;'>Summary</th>
								</tr>
							</thead>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/lib/screens/student/student_semestres_screen.dart'>student_semestres_screen.dart</a></b></td>
									<td style='padding: 8px;'>- Displays a students enrolled semesters and enables viewing detailed grades per semester through interactive dialogs<br>- Integrates with backend services to fetch semester data and corresponding grades, providing a clear overview of academic progress within the apps architecture<br>- Facilitates seamless navigation and data presentation for an enhanced user experience.</td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/lib/screens/student/student_matricula_screen.dart'>student_matricula_screen.dart</a></b></td>
									<td style='padding: 8px;'>- Facilitates student course enrollment management by displaying available and enrolled subjects, enabling seamless registration through user interactions<br>- Integrates with backend services to fetch data, handle enrollment actions, and update the interface dynamically, supporting an intuitive and responsive user experience within the academic system architecture.</td>
								</tr>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/lib/screens/student/student_screen.dart'>student_screen.dart</a></b></td>
									<td style='padding: 8px;'>- Defines the student dashboard interface within the application, enabling students to navigate through key functionalities via a menu-driven layout<br>- Integrates with the overall architecture to facilitate seamless routing and user interaction, presenting a structured view of available options tailored to student users in the academic system.</td>
								</tr>
							</table>
						</blockquote>
					</details>
				</blockquote>
			</details>
			<!-- menu Submodule -->
			<details>
				<summary><b>menu</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ lib.menu</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/lib/menu/menu_item_estudent.dart'>menu_item_estudent.dart</a></b></td>
							<td style='padding: 8px;'>- Defines the data structure for student menu items, encapsulating properties such as name, subtitle, icon, and navigation link<br>- Facilitates dynamic rendering of the student-specific menu interface within the application, supporting easy updates and consistency across the user experience<br>- Serves as a foundational component for organizing and managing student navigation options in the app architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/lib/menu/menu_item_admin.dart'>menu_item_admin.dart</a></b></td>
							<td style='padding: 8px;'>- Defines administrative menu items for the application, facilitating navigation and management of key educational entities such as programs and semesters<br>- Serves as a centralized configuration for the admin interface, enabling streamlined access to core administrative functions within the overall app architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/lib/menu/menu_item_programa_admin.dart'>menu_item_programa_admin.dart</a></b></td>
							<td style='padding: 8px;'>- Defines the structure and content of administrative menu items for the application, facilitating navigation and management of key entities such as professors, students, and subjects within the admin interface<br>- Supports consistent menu rendering and user experience by centralizing menu item data, aligning with the overall architecture for modular and scalable UI design.</td>
						</tr>
					</table>
				</blockquote>
			</details>
			<!-- services Submodule -->
			<details>
				<summary><b>services</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ lib.services</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/lib/services/api_service.dart'>api_service.dart</a></b></td>
							<td style='padding: 8px;'>- Provides a comprehensive API interface for managing user authentication, program and course data, and academic records within the system architecture<br>- Facilitates secure communication with backend services, enabling functionalities such as user login, role management, course enrollment, and grade retrieval, thereby supporting the core administrative, academic, and user-specific operations of the educational platform.</td>
						</tr>
					</table>
				</blockquote>
			</details>
		</blockquote>
	</details>
	<!-- ios Submodule -->
	<details>
		<summary><b>ios</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ ios</b></code>
			<!-- Runner Submodule -->
			<details>
				<summary><b>Runner</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ ios.Runner</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/ios/Runner/AppDelegate.swift'>AppDelegate.swift</a></b></td>
							<td style='padding: 8px;'>- Facilitates the integration of Flutter with iOS by initializing the apps core runtime environment and registering necessary plugins during launch<br>- Ensures seamless communication between Flutter and native iOS components, serving as the primary entry point for app startup and plugin setup within the iOS architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/ios/Runner/Runner-Bridging-Header.h'>Runner-Bridging-Header.h</a></b></td>
							<td style='padding: 8px;'>- Facilitates integration between Flutter and native iOS components by bridging generated plugin registrations<br>- Ensures seamless communication and functionality extension within the iOS platform, supporting the overall architecture of the Flutter application<br>- This header file plays a crucial role in maintaining the interoperability and stability of the app’s native and cross-platform layers.</td>
						</tr>
					</table>
					<!-- Assets.xcassets Submodule -->
					<details>
						<summary><b>Assets.xcassets</b></summary>
						<blockquote>
							<div class='directory-path' style='padding: 8px 0; color: #666;'>
								<code><b>⦿ ios.Runner.Assets.xcassets</b></code>
							<!-- LaunchImage.imageset Submodule -->
							<details>
								<summary><b>LaunchImage.imageset</b></summary>
								<blockquote>
									<div class='directory-path' style='padding: 8px 0; color: #666;'>
										<code><b>⦿ ios.Runner.Assets.xcassets.LaunchImage.imageset</b></code>
									<table style='width: 100%; border-collapse: collapse;'>
									<thead>
										<tr style='background-color: #f8f9fa;'>
											<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
											<th style='text-align: left; padding: 8px;'>Summary</th>
										</tr>
									</thead>
										<tr style='border-bottom: 1px solid #eee;'>
											<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/ios/Runner/Assets.xcassets/LaunchImage.imageset/README.md'>README.md</a></b></td>
											<td style='padding: 8px;'>- Defines customizable launch screen assets for the iOS application, enabling visual branding and user experience personalization during app startup<br>- Integrates with the Flutter projects Xcode workspace to facilitate easy replacement of launch images, ensuring a seamless and branded initial impression within the overall app architecture.</td>
										</tr>
										<tr style='border-bottom: 1px solid #eee;'>
											<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/ios/Runner/Assets.xcassets/LaunchImage.imageset/Contents.json'>Contents.json</a></b></td>
											<td style='padding: 8px;'>- Defines the launch screen assets for the iOS application, ensuring a consistent and visually appealing startup experience across various device sizes and resolutions<br>- Integrates seamlessly into the overall app architecture by providing the initial visual presentation during app launch, contributing to a polished user interface and brand identity.</td>
										</tr>
									</table>
								</blockquote>
							</details>
							<!-- AppIcon.appiconset Submodule -->
							<details>
								<summary><b>AppIcon.appiconset</b></summary>
								<blockquote>
									<div class='directory-path' style='padding: 8px 0; color: #666;'>
										<code><b>⦿ ios.Runner.Assets.xcassets.AppIcon.appiconset</b></code>
									<table style='width: 100%; border-collapse: collapse;'>
									<thead>
										<tr style='background-color: #f8f9fa;'>
											<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
											<th style='text-align: left; padding: 8px;'>Summary</th>
										</tr>
									</thead>
										<tr style='border-bottom: 1px solid #eee;'>
											<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/ios/Runner/Assets.xcassets/AppIcon.appiconset/Contents.json'>Contents.json</a></b></td>
											<td style='padding: 8px;'>- Defines the app icon assets for iOS, specifying various image sizes and scales for different devices and contexts<br>- Ensures consistent branding and visual identity across iPhone, iPad, and marketing materials by providing appropriately scaled icons<br>- Integrates seamlessly into the overall project architecture to support a polished, professional user experience.</td>
										</tr>
									</table>
								</blockquote>
							</details>
						</blockquote>
					</details>
				</blockquote>
			</details>
			<!-- RunnerTests Submodule -->
			<details>
				<summary><b>RunnerTests</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ ios.RunnerTests</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/ios/RunnerTests/RunnerTests.swift'>RunnerTests.swift</a></b></td>
							<td style='padding: 8px;'>- Provides a foundational testing scaffold for the iOS Runner application within the Flutter project<br>- It facilitates the addition of unit tests to ensure the stability and correctness of the apps iOS-specific components, supporting overall code quality and reliability in the broader Flutter architecture.</td>
						</tr>
					</table>
				</blockquote>
			</details>
			<!-- Runner.xcodeproj Submodule -->
			<details>
				<summary><b>Runner.xcodeproj</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ ios.Runner.xcodeproj</b></code>
					<!-- project.xcworkspace Submodule -->
					<details>
						<summary><b>project.xcworkspace</b></summary>
						<blockquote>
							<div class='directory-path' style='padding: 8px 0; color: #666;'>
								<code><b>⦿ ios.Runner.xcodeproj.project.xcworkspace</b></code>
							<!-- xcshareddata Submodule -->
							<details>
								<summary><b>xcshareddata</b></summary>
								<blockquote>
									<div class='directory-path' style='padding: 8px 0; color: #666;'>
										<code><b>⦿ ios.Runner.xcodeproj.project.xcworkspace.xcshareddata</b></code>
									<table style='width: 100%; border-collapse: collapse;'>
									<thead>
										<tr style='background-color: #f8f9fa;'>
											<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
											<th style='text-align: left; padding: 8px;'>Summary</th>
										</tr>
									</thead>
										<tr style='border-bottom: 1px solid #eee;'>
											<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/ios/Runner.xcodeproj/project.xcworkspace/xcshareddata/WorkspaceSettings.xcsettings'>WorkspaceSettings.xcsettings</a></b></td>
											<td style='padding: 8px;'>- Configures workspace settings to disable preview features within the iOS project environment, ensuring a streamlined development experience<br>- It aligns the workspace configuration with project preferences, contributing to consistent behavior across team members and maintaining focus on core development tasks without unnecessary visual distractions.</td>
										</tr>
									</table>
								</blockquote>
							</details>
						</blockquote>
					</details>
				</blockquote>
			</details>
			<!-- Runner.xcworkspace Submodule -->
			<details>
				<summary><b>Runner.xcworkspace</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ ios.Runner.xcworkspace</b></code>
					<!-- xcshareddata Submodule -->
					<details>
						<summary><b>xcshareddata</b></summary>
						<blockquote>
							<div class='directory-path' style='padding: 8px 0; color: #666;'>
								<code><b>⦿ ios.Runner.xcworkspace.xcshareddata</b></code>
							<table style='width: 100%; border-collapse: collapse;'>
							<thead>
								<tr style='background-color: #f8f9fa;'>
									<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
									<th style='text-align: left; padding: 8px;'>Summary</th>
								</tr>
							</thead>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/ios/Runner.xcworkspace/xcshareddata/WorkspaceSettings.xcsettings'>WorkspaceSettings.xcsettings</a></b></td>
									<td style='padding: 8px;'>- Configures workspace settings for the iOS development environment by disabling live previews, ensuring a streamlined and consistent development experience within the Flutter project<br>- It helps maintain a stable workspace configuration, supporting efficient collaboration and reducing environment-related issues during iOS app development.</td>
								</tr>
							</table>
						</blockquote>
					</details>
				</blockquote>
			</details>
		</blockquote>
	</details>
	<!-- macos Submodule -->
	<details>
		<summary><b>macos</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ macos</b></code>
			<!-- Runner Submodule -->
			<details>
				<summary><b>Runner</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ macos.Runner</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/macos/Runner/DebugProfile.entitlements'>DebugProfile.entitlements</a></b></td>
							<td style='padding: 8px;'>- Defines security entitlements for the macOS application, enabling sandboxing, allowing runtime code execution, and permitting network server operations<br>- These settings ensure the app operates within specified security boundaries while maintaining necessary functionalities, supporting the overall architecture by balancing security and performance for the macOS runtime environment.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/macos/Runner/AppDelegate.swift'>AppDelegate.swift</a></b></td>
							<td style='padding: 8px;'>- Defines the application lifecycle behavior for the macOS platform within the Flutter-based project<br>- Manages window closure and state restoration, ensuring the app terminates when all windows are closed and supports secure state preservation, thereby integrating native macOS functionalities into the overall Flutter architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/macos/Runner/MainFlutterWindow.swift'>MainFlutterWindow.swift</a></b></td>
							<td style='padding: 8px;'>- Establishes the main application window for the macOS Flutter app, integrating Flutters rendering engine within the native window framework<br>- Facilitates the display of Flutter content and ensures proper plugin registration, serving as the entry point for rendering the Flutter UI within the macOS environment<br>- This component is essential for bridging native macOS window management with Flutters cross-platform interface.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/macos/Runner/Release.entitlements'>Release.entitlements</a></b></td>
							<td style='padding: 8px;'>- Defines security entitlements for the macOS application, specifically enabling sandboxing to restrict app permissions<br>- This configuration enhances security by isolating the apps runtime environment, ensuring it operates within controlled boundaries<br>- It plays a crucial role in maintaining the overall architectures security posture, aligning with best practices for macOS app deployment and sandboxing standards.</td>
						</tr>
					</table>
					<!-- Assets.xcassets Submodule -->
					<details>
						<summary><b>Assets.xcassets</b></summary>
						<blockquote>
							<div class='directory-path' style='padding: 8px 0; color: #666;'>
								<code><b>⦿ macos.Runner.Assets.xcassets</b></code>
							<!-- AppIcon.appiconset Submodule -->
							<details>
								<summary><b>AppIcon.appiconset</b></summary>
								<blockquote>
									<div class='directory-path' style='padding: 8px 0; color: #666;'>
										<code><b>⦿ macos.Runner.Assets.xcassets.AppIcon.appiconset</b></code>
									<table style='width: 100%; border-collapse: collapse;'>
									<thead>
										<tr style='background-color: #f8f9fa;'>
											<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
											<th style='text-align: left; padding: 8px;'>Summary</th>
										</tr>
									</thead>
										<tr style='border-bottom: 1px solid #eee;'>
											<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/macos/Runner/Assets.xcassets/AppIcon.appiconset/Contents.json'>Contents.json</a></b></td>
											<td style='padding: 8px;'>- Defines the set of app icons for the macOS application, ensuring consistent visual branding across various display sizes and resolutions<br>- Integrates multiple icon assets into the project, facilitating proper scaling and appearance within the macOS environment<br>- Supports the overall user interface design by providing appropriately sized icons for different contexts and device specifications.</td>
										</tr>
									</table>
								</blockquote>
							</details>
						</blockquote>
					</details>
				</blockquote>
			</details>
			<!-- Flutter Submodule -->
			<details>
				<summary><b>Flutter</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ macos.Flutter</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/macos/Flutter/GeneratedPluginRegistrant.swift'>GeneratedPluginRegistrant.swift</a></b></td>
							<td style='padding: 8px;'>- Registers platform-specific plugins for macOS within the Flutter application, enabling seamless integration of secure storage and path management functionalities<br>- Serves as a crucial component in the plugin registration process, ensuring that native capabilities are correctly linked and accessible to the Flutter framework, thereby supporting the app’s cross-platform architecture and feature set.</td>
						</tr>
					</table>
				</blockquote>
			</details>
			<!-- RunnerTests Submodule -->
			<details>
				<summary><b>RunnerTests</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ macos.RunnerTests</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/Erik-egam/sistema_academico/blob/master/macos/RunnerTests/RunnerTests.swift'>RunnerTests.swift</a></b></td>
							<td style='padding: 8px;'>- Provides a foundational test structure for the macOS Flutter application, enabling validation of core functionalities within the Runner environment<br>- Serves as a starting point for implementing unit tests to ensure stability and correctness of the app’s integration with macOS-specific components, supporting overall code quality and reliability in the project architecture.</td>
						</tr>
					</table>
				</blockquote>
			</details>
		</blockquote>
	</details>
</details>

---

## 🚀 Getting Started

### 📋 Prerequisites

This project requires the following dependencies:

- **Programming Language:** Dart
- **Package Manager:** Pub, Gradle, Cmake

### ⚙️ Installation

Build sistema_academico from the source and install dependencies:

1. **Clone the repository:**

    ```sh
    ❯ git clone https://github.com/Erik-egam/sistema_academico
    ```

2. **Navigate to the project directory:**

    ```sh
    ❯ cd sistema_academico
    ```

3. **Install the dependencies:**

**Using [pub](https://dart.dev/):**

```sh
❯ pub get
```
**Using [gradle](https://gradle.org/):**

```sh
❯ gradle build
```
**Using [cmake](https://isocpp.org/):**

```sh
❯ cmake . && make
```

### 💻 Usage

Run the project with:

**Using [pub](https://dart.dev/):**

```sh
dart {entrypoint}
```
**Using [gradle](https://gradle.org/):**

```sh
gradle run
```
**Using [cmake](https://isocpp.org/):**

```sh
./sistema_academico
```

### 🧪 Testing

Sistema_academico uses the {__test_framework__} test framework. Run the test suite with:

**Using [pub](https://dart.dev/):**

```sh
pub run test
```
**Using [gradle](https://gradle.org/):**

```sh
gradle test
```
**Using [cmake](https://isocpp.org/):**

```sh
ctest
```

---


## ✨ Acknowledgments

- Credit `Erik Arroyo`, `Jorge Ingenieria de software 3`, etc.

<div align="left"><a href="#top">⬆ Return</a></div>

---
