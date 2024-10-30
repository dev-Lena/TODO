# SwiftUI Todo App

<img src="https://github.com/user-attachments/assets/57e27976-bf8a-4406-ba6f-7fa7f8de7a3b" width = "200">

SwiftUI와 Async/Await, Combine을 사용하여 MVVM 아키텍처로 구현한 간단한 To-Do 앱입니다. 
할 일 목록을 `UserDefaults`에 저장하여 앱 종료 후에도 데이터를 유지하며, 
각 탭에서 동일한 `TodoService` 인스턴스를 공유하여 앱 상태를 관리합니다.

## 주요 기능
- 할 일 목록을 **List**와 **Grid 뷰**에서 표시
- 할 일 **추가 및 삭제** 기능
- 앱 종료 후에도 데이터를 유지하는 **UserDefaults** 기반 데이터 저장
- **MVVM 아키텍처**
- **async/await**으로 삭제/추가 결과를 리턴
- 삭제/추가 결과를 **Combine**를 활용해 전달

---
## 주요 구성 요소

### Models
- **Todo**: Identifiable 및 Codable을 채택한 할 일 데이터 모델입니다.
- **TodoRepository**: `UserDefaults`에 데이터를 저장하고 불러오는 작업을 담당합니다.
- **TodoService**: `TodoRepository`를 사용하여 할 일 데이터를 관리하며, 비즈니스 로직(추가/삭제)을 처리하고 Combine을 통해 상태를 뷰 모델에 전달합니다.

### ViewModels
- **ListTabViewModel**: List 탭 뷰의 뷰 모델로, `TodoService`를 통해 할 일 목록 데이터를 가져오고 `addTodo()` 메서드를 사용해 비동기로 할 일을 추가할 수 있습니다.
- **GridTabViewModel**: Grid 탭 뷰의 뷰 모델로, `TodoService`를 통해 할 일 목록을 관리하며 비동기로 마지막 할 일을 삭제할 수 있습니다.

### Views
- **ContentView**: `@StateObject`로 생성된 `TodoService` 인스턴스를 각 뷰에 전달하고, SwiftUI의 `TabView`로 전체 앱 탭을 관리합니다.
- **ListTabView**: 할 일 목록을 List 형식으로 보여주는 탭입니다. Add 버튼을 누르면 임의의 할 일이 추가됩니다.
- **GridTabView**: 할 일을 Grid 형식으로 보여주는 탭으로, Delete Last 버튼을 누르면 마지막에 추가된 할 일을 삭제합니다.

---

## 주요 기술

- **SwiftUI**: UI 레이아웃과 데이터 바인딩을 위한 SwiftUI 사용.
- **MVVM 아키텍처**: 뷰와 비즈니스 로직을 분리하여 구현.
- **Combine**: 데이터 스트림 관리 및 비동기 데이터 흐름 관리.
- **async/await**: 비동기 작업의 간결한 처리.
- **UserDefaults**: 앱 데이터의 로컬 저장 및 유지.
