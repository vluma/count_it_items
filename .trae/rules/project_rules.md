# Flutter & Dart 高级开发规范 (Clean Architecture + MVVM)
## 1. 核心架构模式
* **分层原则**：严格遵守 `Data -> Domain <- Presentation`。
* **Domain (领域层)**：必须是纯 Dart 代码。包含 `Entities` (实体) 和 `Repository Interfaces` (接口抽象)。
* **Data (数据层)**：负责数据获取。包含 `Models` (DTOs)、`DataSources` 和 `Repository Implementations`。
* **Presentation (表示层)**：包含 `Bloc/Cubit` (ViewModel) 和 `Widgets/Pages` (View)。

* **依赖注入**：统一使用 `GetIt` 进行服务定位。
* **响应式 UI**：使用 `flutter_screenutil` 进行适配，UI 数值必须包裹在 `.sp`, `.w`, `.h` 中。

## 2. 状态管理 (Bloc + Freezed)
* **不可变性**：所有 `State` 和 `Event` 必须使用 `@freezed` 注解，确保不可变性。
* **状态设计**：State 应包含多个 `factory` 构造函数（如 `initial`, `loading`, `loaded`, `error`），或使用单一 State 配合状态枚举。
* **逻辑分离**：
* `Bloc` 只处理业务逻辑并映射到 `State`。
* UI 只通过 `context.read<MyBloc>().add(MyEvent())` 触发行为。
* UI 使用 `BlocBuilder` 或 `BlocConsumer` 进行局部刷新。

```dart
// 示例代码模式
@freezed
class MapState with _$MapState {
  const factory MapState.initial() = _Initial;
  const factory MapState.loading() = _Loading;
  const factory MapState.success({required List<Item> items}) = _Success;
}

```

## 3. 数据层与序列化
* **Models vs Entities**：
* `Data/Models` 是 JSON 转换层，使用 `@JsonSerializable`。
* `Domain/Entities` 是纯业务对象。
* 在 Repository 实现类中，必须将 `Model` 转换为 `Entity` 后再传给领域层。

* **本地存储**：使用 `Isar`。定义 Schema 时需保持简洁，并使用 `isar` 的生成命令。
* **代码生成**：修改模型后，必须运行：
`dart run build_runner build --delete-conflicting-outputs`

## 4. UI 与视觉风格 (极简/磨砂)
* **极简主义**：优先使用 `AppColors` 中定义的白色调。
* **磨砂效果**：跨模块 UI 优先封装 `GlassCard` 组件，统一 `glassmorphism` 参数。
* **动画**：简单的状态切换优先使用 `flutter_animate`。
* **图片加载**：对于网络图片，必须封装带占位图和错误处理的 `NetworkImage`。

## 5. 目录与命名规范
* **功能导向 (Feature-First)**：新功能必须在 `features/` 下创建独立文件夹。
* **命名约定**：
* 文件：`snake_case` (如 `map_view_model.dart`)。
* 类：`PascalCase` (如 `MapViewModel`)。
* 变量：`camelCase`。

* **导出文件**：在每个主要文件夹下使用 `barrel files` (index.dart) 以简化导入（可选）。

## 6. 工具使用守则
* **Linter**：使用严格模式。禁止 `print`，必须使用 `developer.log`。
* **DI 注册**：每新增一个 Service 或 Repository，必须在 `di/` 配置文件中手动或通过 `injectable` 注册。
* **错误处理**：严禁静默错误。数据层异常必须映射为 `Failure` 对象，通过 `Either` 或 `Result` 模式传给 UI（推荐配合 `fpdart` 或自定义 Result 类）。

### 项目初始化检查单 (Next Step)
1. **环境配置**：是否已运行 `flutter pub add` 添加所有依赖？
2. **代码生成**：是否已创建 `freezed` 和 `json_serializable` 的基础模板？
3. **主题注入**：是否在 `lib/core/theme` 中定义了基于 `ColorScheme.fromSeed` 的白色主题？
4. **适配初始化**：`main.dart` 中是否已包裹 `ScreenUtilInit`？

### 📂 项目目录架构守则 (Folder Structure)
AI 在生成代码或新建文件时，必须严格遵守以下目录规范：
* **`lib/core/`**: 存放全局单例和硬核配置。
* `theme/`: 仅允许定义极简白色主题及 `AppColors`。
* `di/`: 依赖注入注册中心 (`get_it`)。


* **`lib/domain/` (领域层 - 业务核心)**:
* `entities/`: 纯粹的 Dart 对象，使用 `freezed` 定义不可变实体。
* `repositories/`: 定义抽象接口类，不包含具体实现。


* **`lib/data/` (数据层 - 具体实现)**:
* `models/`: DTO 对象，负责 JSON 序列化 (`json_serializable`)。
* `repositories/`: 实现 `domain` 层定义的接口，负责处理 `Isar` 本地缓存与 `Dio` 远程数据的逻辑转换。


* **`lib/features/` (功能层 - MVVM 模式)**:
* 每个功能模块必须包含 `view/` (Widgets) 和 `view_model/` (Bloc/Cubit)。
* **状态管理**: 必须使用 `flutter_bloc` 搭配 `freezed` 生成 `State` 和 `Event`。


* **`lib/shared/`**: 存放高频复用的 UI 组件，如 `GlassCard` (磨砂玻璃卡片)。


### 🛠 指令增强 (Instructions)

当我在对话中提到“新建一个功能”时，请自动按以下流程思考：

1. 在 `domain/entities` 定义数据实体。
2. 在 `domain/repositories` 定义操作接口。
3. 在 `data/repositories` 实现该接口并注入 `datasource`。
4. 在 `features/` 下创建对应的 `bloc` 和 `page`。



这是一个非常专业的工程化建议。在 **Clean Architecture** 架构下，**测试驱动开发 (TDD)** 能极大减少由于模型（Model）转换或业务逻辑错误导致的线上 Bug。

我们将这一条正式加入你的规则体系。以下是为你更新后的 **测试与逻辑验证规则**：

---

### 🧪 逻辑验证与测试先行规则 (Test-Driven Development)

在执行任何具有逻辑需求的任务（如：新的 Repository 实现、Bloc 业务逻辑切换、数据解析）时，AI 必须遵循以下流程：

#### 1. 测试先行原则 (Write Test First)

* **优先生成测试**: 在编写具体逻辑代码之前，必须先在 `test/` 目录下创建对应的测试文件。
* **Unit Tests**: 针对 `domain` 层的业务逻辑和 `data` 层的解析逻辑。
* **Bloc Tests**: 使用 `bloc_test` 封装包来验证状态流转。


* **Mock 守则**: 优先使用 `fakes` 或手动实现的 `stubs`。若需复杂 Mock，使用 `mocktail`。

#### 2. 静态检查与报错验证

* **实时分析**: 在提供代码方案后，必须自动检查代码是否符合 Dart 语法。
* **修复报错**:
* 检查 `freezed` 生成类是否会导致“未定义类”错误，并提醒用户运行 `build_runner`。
* 检查依赖注入（GetIt）是否可能存在未注册的风险。


* **健全性验证**: 如果逻辑涉及多个类（如 Repository 依赖 DataSource），AI 需确保所有关联类的构造函数签名是一致的。

#### 3. 任务执行 SOP
1. **分析需求**: 明确输入、输出及可能的异常（Failures）。
2. **编写测试**: 提供 `test/..._test.dart` 代码，定义预期的行为。
3. **编写实现**: 提供 `lib/...` 业务代码。
4. **自检**: 验证代码段中是否存在明显的 Lint 错误或逻辑断裂。


### 📂 推荐的测试目录结构

test/
├── features/
│   └── map/
│       └── view_model/map_bloc_test.dart  # 测试状态机
├── domain/
│   └── usecases/                         # 测试核心业务逻辑
└── data/
    └── repositories/                     # 测试数据转换与异常处理