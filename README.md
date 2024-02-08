
# Zens Evaluation Test

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
- [Folder Structure](#folder-structure)

## Introduction
Evalutation test for ZenS company(https://zen-s.com/)
## Features

This is just the simple app with 2 main function:
- Show list drinks
- Order Drink
## Getting Started
### Prerequisites

List any software, tools, or dependencies that users need to have installed before running your project.

- Flutter (version 3 or latest)
- Dart (v3.0.5 or latest)
- Android Studio or VScode (latest version)
### Installation
You can install my application by using these steps:
open yout CMD
  ```bash
git clone https://github.com/ndkai/zens_evaluation_test.git
cd zens_evaluation_test
flutter pub get
flutter run
```

## Folder Structure
 - core


## Installation

Install my-project with npm

```bash
  npm install my-project
  cd my-project
```
    
# Zens Evaluation Test

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
- [Folder Structure](#folder-structure)

## Introduction
Evalutation test for ZenS company(https://zen-s.com/)
## Features

This is just the simple app with 2 main function:
- Show list drinks
- Order Drink
## Getting Started
### Prerequisites

List any software, tools, or dependencies that users need to have installed before running your project.

- Flutter (version 3 or latest)
- Dart (v3.0.5 or latest)
- Android Studio or VScode (latest version)
### Installation
You can install my application by using these steps:
open yout CMD
  ```bash
git clone https://github.com/ndkai/zens_evaluation_test.git
cd zens_evaluation_test
flutter pub get
flutter run
```

## Folder Structure
|-- lib/
|   |-- core/
|   |-- features/
|   |   |-- feature/
|   |   |   |--data/
|   |   |   |    |--data_source
|   |   |   |    |--models
|   |   |   |    |--repositories
|   |   |   |--domain/
|   |   |   |    |--entities
|   |   |   |    |--repositories
|   |   |   |    |--usecases
|   |   |   |--presentation/
|   |   |   |    |--pages
|   |   |   |    |--widgets

1. Core Folder
It is contains all essential files to use in all the app:
 - Constant: Store app constant object.
 - Helper: Store helper function 
 - Keys: Store widget Keys
 - MyStreamController: Store app state management
 - ProviderWidget: Store app FutureBuilder widget
 - SizeConfig: app size management
 - Ui: Store helper function for widget
 - UseCase: Usecase to get data from application
2. Features
 - Data: Has missions to get data from server or local
 - Domain: The domain layer defines an interface with methods defining what data it needs
 - Presentations: Manage app widgets and states
