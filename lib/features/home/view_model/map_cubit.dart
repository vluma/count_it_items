import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youwu/domain/entities/item_entity.dart';
import 'package:youwu/domain/repositories/space_repository.dart';
import 'package:youwu/domain/repositories/item_repository.dart';
import 'package:youwu/features/home/view_model/map_event.dart';
import 'package:youwu/features/home/view_model/map_state.dart';

class MapCubit extends Bloc<MapEvent, MapState> {
  final SpaceRepository spaceRepository;
  final ItemRepository itemRepository;
  
  bool _showOverlay = true;
  bool _isSearching = false;
  bool _isEditMode = false;
  
  List<ItemEntity> _cachedExpiredItems = [];
  List<ItemEntity> _cachedExpiringItems = [];
  
  MapCubit({
    required this.spaceRepository,
    required this.itemRepository,
  }) : super(const MapState.initial()) {
    on<LoadMap>(_onLoadMap);
    on<SelectRoom>(_onSelectRoom);
    on<DeselectRoom>(_onDeselectRoom);
    on<ToggleOverlay>(_onToggleOverlay);
    on<Search>(_onSearch);
    on<ClearSearch>(_onClearSearch);
    on<UpdateTransform>(_onUpdateTransform);
    on<DoubleTapEmpty>(_onDoubleTapEmpty);
    on<AddRoom>(_onAddRoom);
    on<UpdateRoom>(_onUpdateRoom);
    on<DeleteRoom>(_onDeleteRoom);
    on<UpdateRoomPoints>(_onUpdateRoomPoints);
    on<ToggleEditMode>(_onToggleEditMode);
  }
  
  Future<void> _onLoadMap(LoadMap event, Emitter<MapState> emit) async {
    emit(const MapState.loading());
    
    try {
      final space = await spaceRepository.getSpaceData();
      _cachedExpiredItems = await itemRepository.getExpiredItems();
      _cachedExpiringItems = await itemRepository.getExpiringItems();
      
      emit(MapState.success(
        space: space,
        showOverlay: _showOverlay,
        isSearching: _isSearching,
        expiredItems: _cachedExpiredItems,
        expiringItems: _cachedExpiringItems,
      ));
    } catch (e) {
      emit(MapState.error(message: e.toString()));
    }
  }
  
  Future<void> _onSelectRoom(SelectRoom event, Emitter<MapState> emit) async {
    try {
      final room = await spaceRepository.selectRoom(event.roomId);
      emit(MapState.roomSelected(room: room));
      
      final space = await spaceRepository.getSpaceData();
      emit(MapState.success(
        space: space,
        showOverlay: _showOverlay,
        isSearching: _isSearching,
        expiredItems: _cachedExpiredItems,
        expiringItems: _cachedExpiringItems,
      ));
    } catch (e) {
      emit(MapState.error(message: e.toString()));
    }
  }
  
  Future<void> _onDeselectRoom(DeselectRoom event, Emitter<MapState> emit) async {
    try {
      await spaceRepository.deselectRoom();
      
      final space = await spaceRepository.getSpaceData();
      emit(MapState.success(
        space: space,
        showOverlay: _showOverlay,
        isSearching: _isSearching,
        expiredItems: _cachedExpiredItems,
        expiringItems: _cachedExpiringItems,
      ));
    } catch (e) {
      emit(MapState.error(message: e.toString()));
    }
  }
  
  Future<void> _onToggleOverlay(ToggleOverlay event, Emitter<MapState> emit) async {
    try {
      await spaceRepository.toggleOverlay();
      _showOverlay = !_showOverlay;
      
      final space = await spaceRepository.getSpaceData();
      emit(MapState.success(
        space: space,
        showOverlay: _showOverlay,
        isSearching: _isSearching,
        expiredItems: _cachedExpiredItems,
        expiringItems: _cachedExpiringItems,
      ));
    } catch (e) {
      emit(MapState.error(message: e.toString()));
    }
  }
  
  Future<void> _onSearch(Search event, Emitter<MapState> emit) async {
    try {
      _isSearching = true;
      final results = await spaceRepository.search(event.query);
      emit(MapState.searchResult(results: results));
      
      final space = await spaceRepository.getSpaceData();
      emit(MapState.success(
        space: space,
        showOverlay: _showOverlay,
        isSearching: _isSearching,
        expiredItems: _cachedExpiredItems,
        expiringItems: _cachedExpiringItems,
      ));
    } catch (e) {
      emit(MapState.error(message: e.toString()));
    }
  }
  
  Future<void> _onClearSearch(ClearSearch event, Emitter<MapState> emit) async {
    try {
      _isSearching = false;
      await spaceRepository.unhighlightRoom();
      
      final space = await spaceRepository.getSpaceData();
      emit(MapState.success(
        space: space,
        showOverlay: _showOverlay,
        isSearching: _isSearching,
        expiredItems: _cachedExpiredItems,
        expiringItems: _cachedExpiringItems,
      ));
    } catch (e) {
      emit(MapState.error(message: e.toString()));
    }
  }
  
  Future<void> _onUpdateTransform(UpdateTransform event, Emitter<MapState> emit) async {
    try {
      await spaceRepository.updateSpaceTransform(
        event.scale,
        event.offsetX,
        event.offsetY,
      );
      
      final space = await spaceRepository.getSpaceData();
      emit(MapState.success(
        space: space,
        showOverlay: _showOverlay,
        isSearching: _isSearching,
        expiredItems: _cachedExpiredItems,
        expiringItems: _cachedExpiringItems,
      ));
    } catch (e) {
      emit(MapState.error(message: e.toString()));
    }
  }
  
  Future<void> _onDoubleTapEmpty(DoubleTapEmpty event, Emitter<MapState> emit) async {
    try {
      await spaceRepository.deselectRoom();
      
      final space = await spaceRepository.getSpaceData();
      emit(MapState.success(
        space: space,
        showOverlay: _showOverlay,
        isSearching: _isSearching,
        expiredItems: _cachedExpiredItems,
        expiringItems: _cachedExpiringItems,
      ));
    } catch (e) {
      emit(MapState.error(message: e.toString()));
    }
  }
  
  Future<void> _onAddRoom(AddRoom event, Emitter<MapState> emit) async {
    try {
      emit(const MapState.loading());
      
      await spaceRepository.addRoom(event.room);
      
      final space = await spaceRepository.getSpaceData();
      emit(MapState.success(
        space: space,
        showOverlay: _showOverlay,
        isSearching: _isSearching,
        expiredItems: _cachedExpiredItems,
        expiringItems: _cachedExpiringItems,
      ));
    } catch (e) {
      emit(MapState.error(message: e.toString()));
    }
  }
  
  Future<void> _onUpdateRoom(UpdateRoom event, Emitter<MapState> emit) async {
    try {
      emit(const MapState.loading());
      
      await spaceRepository.updateRoom(event.room);
      
      final space = await spaceRepository.getSpaceData();
      emit(MapState.success(
        space: space,
        showOverlay: _showOverlay,
        isSearching: _isSearching,
        expiredItems: _cachedExpiredItems,
        expiringItems: _cachedExpiringItems,
      ));
    } catch (e) {
      emit(MapState.error(message: e.toString()));
    }
  }
  
  Future<void> _onDeleteRoom(DeleteRoom event, Emitter<MapState> emit) async {
    try {
      emit(const MapState.loading());
      
      await spaceRepository.deleteRoom(event.roomId);
      
      final space = await spaceRepository.getSpaceData();
      emit(MapState.success(
        space: space,
        showOverlay: _showOverlay,
        isSearching: _isSearching,
        expiredItems: _cachedExpiredItems,
        expiringItems: _cachedExpiringItems,
      ));
    } catch (e) {
      emit(MapState.error(message: e.toString()));
    }
  }
  
  Future<void> _onUpdateRoomPoints(UpdateRoomPoints event, Emitter<MapState> emit) async {
    try {
      await spaceRepository.updateRoomPoints(event.roomId, event.points);
      
      final space = await spaceRepository.getSpaceData();
      emit(MapState.success(
        space: space,
        showOverlay: _showOverlay,
        isSearching: _isSearching,
        expiredItems: _cachedExpiredItems,
        expiringItems: _cachedExpiringItems,
      ));
    } catch (e) {
      emit(MapState.error(message: e.toString()));
    }
  }
  
  Future<void> _onToggleEditMode(ToggleEditMode event, Emitter<MapState> emit) async {
    _isEditMode = !_isEditMode;
    
    final space = await spaceRepository.getSpaceData();
    emit(MapState.success(
      space: space,
      showOverlay: _showOverlay,
      isSearching: _isSearching,
      expiredItems: _cachedExpiredItems,
      expiringItems: _cachedExpiringItems,
    ));
  }
}
