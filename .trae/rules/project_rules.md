# Flutter & Dart 开发规范

## 架构原则
- **分层**：`Data -> Domain <- Presentation`
- **Domain 层**：纯 Dart 代码，包含 `Entities` 和 `Repository Interfaces`
- **Data 层**：负责数据获取，包含 `Models` 和 `Repository Implementations`
- **Presentation 层**：包含 `Bloc/Cubit` 和 `Widgets/Pages`
- **依赖注入**：使用 `GetIt`
- **响应式 UI**：使用 `flutter_screenutil`，数值使用 `.sp`, `.w`, `.h`

## 状态管理
- **不可变性**：`State` 和 `Event` 使用 `@freezed` 注解
- **状态设计**：包含 `initial`, `loading`, `loaded`, `error` 等状态
- **逻辑分离**：Bloc 处理业务逻辑，UI 触发行为和显示状态

## 数据处理
- **Models vs Entities**：`Models` 负责 JSON 序列化，`Entities` 是业务对象
- **本地存储**：使用 `Isar`
- **代码生成**：修改模型后运行 `dart run build_runner build --delete-conflicting-outputs`
- **错误处理**：数据层异常映射为 `Failure` 对象传递

## UI 规范
- **极简风格**：使用 `AppColors` 中定义的白色调
- **磨砂效果**：跨模块 UI 使用 `GlassCard` 组件
- **颜色透明度**：使用 `withValues(alpha: value)`

## 代码规范
- **功能导向**：新功能在 `features/` 下创建独立文件夹
- **命名约定**：文件 `snake_case`，类 `PascalCase`，变量 `camelCase`
- **Linter**：使用严格模式，使用 `developer.log` 替代 `print`

## 目录结构
- **`lib/core/`**：全局配置
- **`lib/domain/`**：业务核心
- **`lib/data/`**：数据实现
- **`lib/features/`**：功能模块
- **`lib/shared/`**：复用组件

## 新建功能流程
1. 在 `domain/entities` 定义数据实体
2. 在 `domain/repositories` 定义操作接口
3. 在 `data/repositories` 实现接口
4. 在 `features/` 下创建 `bloc` 和 `page`

## 测试驱动开发
- **测试先行**：先创建测试文件，再实现代码
- **执行流程**：分析需求 → 编写测试 → 编写实现 → 自检
