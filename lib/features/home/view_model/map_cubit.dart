import 'package:bloc/bloc.dart';
import 'package:count_it_items/domain/repositories/space_repository.dart';
import 'package:count_it_items/features/home/view_model/map_event.dart';
import 'package:count_it_items/features/home/view_model/map_state.dart';

class MapCubit extends Bloc<MapEvent, MapState> {
  final SpaceRepository spaceRepository;
  
  // 是否显示覆盖层
  bool _showOverlay = true;
  
  // 是否正在搜索
  bool _isSearching = false;
  
  MapCubit({required this.spaceRepository}) : super(const MapState.initial()) {
    // 注册事件处理器
    on<LoadMap>(_onLoadMap);
    on<SelectRoom>(_onSelectRoom);
    on<DeselectRoom>(_onDeselectRoom);
    on<ToggleOverlay>(_onToggleOverlay);
    on<Search>(_onSearch);
    on<ClearSearch>(_onClearSearch);
    on<UpdateTransform>(_onUpdateTransform);
    on<DoubleTapEmpty>(_onDoubleTapEmpty);
  }
  
  // 处理加载地图事件
  Future<void> _onLoadMap(LoadMap event, Emitter<MapState> emit) async {
    emit(const MapState.loading());
    
    try {
      // 从仓库获取空间数据
      final space = await spaceRepository.getSpaceData();
      
      // 发射成功状态
      emit(MapState.success(
        space: space,
        showOverlay: _showOverlay,
        isSearching: _isSearching,
      ));
    } catch (e) {
      // 发射错误状态
      emit(MapState.error(message: e.toString()));
    }
  }
  
  // 处理选择房间事件
  Future<void> _onSelectRoom(SelectRoom event, Emitter<MapState> emit) async {
    try {
      // 调用仓库选择房间
      final room = await spaceRepository.selectRoom(event.roomId);
      
      // 发射房间选中状态
      emit(MapState.roomSelected(room: room));
      
      // 重新加载空间数据，更新UI
      final space = await spaceRepository.getSpaceData();
      emit(MapState.success(
        space: space,
        showOverlay: _showOverlay,
        isSearching: _isSearching,
      ));
    } catch (e) {
      emit(MapState.error(message: e.toString()));
    }
  }
  
  // 处理取消选择房间事件
  Future<void> _onDeselectRoom(DeselectRoom event, Emitter<MapState> emit) async {
    try {
      // 调用仓库取消选择房间
      await spaceRepository.deselectRoom();
      
      // 重新加载空间数据，更新UI
      final space = await spaceRepository.getSpaceData();
      emit(MapState.success(
        space: space,
        showOverlay: _showOverlay,
        isSearching: _isSearching,
      ));
    } catch (e) {
      emit(MapState.error(message: e.toString()));
    }
  }
  
  // 处理切换覆盖层事件
  Future<void> _onToggleOverlay(ToggleOverlay event, Emitter<MapState> emit) async {
    try {
      // 调用仓库切换覆盖层
      await spaceRepository.toggleOverlay();
      
      // 更新本地状态
      _showOverlay = !_showOverlay;
      
      // 重新加载空间数据，更新UI
      final space = await spaceRepository.getSpaceData();
      emit(MapState.success(
        space: space,
        showOverlay: _showOverlay,
        isSearching: _isSearching,
      ));
    } catch (e) {
      emit(MapState.error(message: e.toString()));
    }
  }
  
  // 处理搜索事件
  Future<void> _onSearch(Search event, Emitter<MapState> emit) async {
    try {
      // 更新搜索状态
      _isSearching = true;
      
      // 调用仓库搜索
      final results = await spaceRepository.search(event.query);
      
      // 发射搜索结果状态
      emit(MapState.searchResult(results: results));
      
      // 重新加载空间数据，更新UI
      final space = await spaceRepository.getSpaceData();
      emit(MapState.success(
        space: space,
        showOverlay: _showOverlay,
        isSearching: _isSearching,
      ));
    } catch (e) {
      emit(MapState.error(message: e.toString()));
    }
  }
  
  // 处理清除搜索事件
  Future<void> _onClearSearch(ClearSearch event, Emitter<MapState> emit) async {
    try {
      // 更新搜索状态
      _isSearching = false;
      
      // 调用仓库取消高亮
      await spaceRepository.unhighlightRoom();
      
      // 重新加载空间数据，更新UI
      final space = await spaceRepository.getSpaceData();
      emit(MapState.success(
        space: space,
        showOverlay: _showOverlay,
        isSearching: _isSearching,
      ));
    } catch (e) {
      emit(MapState.error(message: e.toString()));
    }
  }
  
  // 处理更新变换事件
  Future<void> _onUpdateTransform(UpdateTransform event, Emitter<MapState> emit) async {
    try {
      // 调用仓库更新空间变换
      await spaceRepository.updateSpaceTransform(
        event.scale,
        event.offsetX,
        event.offsetY,
      );
      
      // 重新加载空间数据，更新UI
      final space = await spaceRepository.getSpaceData();
      emit(MapState.success(
        space: space,
        showOverlay: _showOverlay,
        isSearching: _isSearching,
      ));
    } catch (e) {
      emit(MapState.error(message: e.toString()));
    }
  }
  
  // 处理双击空白处事件
  Future<void> _onDoubleTapEmpty(DoubleTapEmpty event, Emitter<MapState> emit) async {
    try {
      // 调用仓库取消选择房间
      await spaceRepository.deselectRoom();
      
      // 重新加载空间数据，更新UI
      final space = await spaceRepository.getSpaceData();
      emit(MapState.success(
        space: space,
        showOverlay: _showOverlay,
        isSearching: _isSearching,
      ));
    } catch (e) {
      emit(MapState.error(message: e.toString()));
    }
  }
}
