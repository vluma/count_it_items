# 实现首页"The Canvas"的详细计划

## 一、目录结构创建

按照Clean Architecture + MVVM规范创建项目目录：

```
lib/
├── core/               # 核心配置
│   ├── di/             # 依赖注入
│   └── theme/          # 主题配置
├── domain/             # 领域层
│   ├── entities/       # 实体类
│   └── repositories/   # 仓库接口
├── data/               # 数据层
│   ├── models/         # 数据模型
│   └── repositories/   # 仓库实现
├── features/           # 功能层
│   └── home/           # 首页功能
│       ├── view/       # 视图
│       └── view_model/ # 视图模型
└── shared/             # 共享组件
```

## 二、依赖添加

在pubspec.yaml中添加最新版本的必要依赖：

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  
  # 状态管理
  flutter_bloc: ^8.1.6
  freezed: ^2.5.2
  freezed_annotation: ^2.4.1
  
  # JSON序列化
  json_annotation: ^4.9.0
  
  # 依赖注入
  get_it: ^8.0.0
  
  # 屏幕适配
  flutter_screenutil: ^5.9.3
  
  # 本地存储
  isar: ^3.1.0+1
  isar_flutter_libs: ^3.1.0+1
  
  # 触感反馈
  vibration: ^1.9.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^6.0.0
  
  # 代码生成
  build_runner: ^2.4.11
  json_serializable: ^6.8.0
  isar_generator: ^3.1.0+1
```

## 三、核心配置实现

1. **主题配置**：
   - 创建`AppColors`类，定义白色极简风格的颜色
   - 配置`ThemeData`，使用`ColorScheme.fromSeed`

2. **依赖注入**：
   - 初始化`GetIt`容器
   - 注册仓库和服务

## 四、领域层实现

1. **实体类**：
   - 创建`SpaceEntity`，包含房间ID、名称、坐标点、物品数量等
   - 创建`RoomEntity`，表示单个房间

2. **仓库接口**：
   - 创建`SpaceRepository`接口，定义获取空间数据的方法

## 五、数据层实现

1. **数据模型**：
   - 创建`SpaceModel`，对应JSON数据
   - 创建`RoomModel`，对应房间数据

2. **仓库实现**：
   - 创建`SpaceRepositoryImpl`，实现`SpaceRepository`接口
   - 处理本地存储和网络请求

## 六、首页功能实现

1. **视图模型**：
   - 创建`MapCubit`，管理首页状态
   - 定义`MapState`，包含加载、成功、失败等状态
   - 实现`LoadMapEvent`、`SelectRoomEvent`、`ToggleOverlayEvent`等事件

2. **视图**：
   - 创建`HomePage`，使用Stack布局
   - 实现`HomeHeader`，包含标题和天气信息
   - 实现`HomeBottomDock`，包含搜索条和相机按钮
   - 实现`MapPainter`，绘制2.5D极简线框图
   - 实现`InteractiveViewer`，支持双指缩放和惯性平移

3. **交互功能**：
   - 实现房间点击事件，添加克莱因蓝呼吸灯效果
   - 实现双击空白处回归中心
   - 实现搜索高亮功能
   - 实现相机拍照后的光点引导

4. **动画效果**：
   - 实现骨架屏加载
   - 实现Hero动画转场
   - 实现触感反馈

## 七、共享组件实现

1. **GlassCard**：毛玻璃效果卡片
2. **ShimmerEffect**：骨架屏加载效果
3. **HapticFeedback**：触感反馈工具类

## 八、代码生成

运行代码生成命令：

```bash
dart run build_runner build --delete-conflicting-outputs
```

## 九、测试和调试

1. 测试首页布局和交互
2. 测试状态管理
3. 测试动画效果
4. 测试响应式设计

## 十、优化和完善

1. 优化性能，减少重绘
2. 完善错误处理
3. 优化用户体验
4. 添加国际化支持

## 实现步骤

1. 创建目录结构
2. 添加依赖
3. 实现核心配置
4. 实现领域层
5. 实现数据层
6. 实现首页功能
7. 实现共享组件
8. 代码生成
9. 测试和调试
10. 优化和完善

通过以上步骤，我们将实现一个基于MVVM架构、白色极简风格、支持平面图交互的沉浸式首页"The Canvas"。