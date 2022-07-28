abstract class AppStates {}

class AppInitialState extends AppStates {}

class CreateDatabaseState extends AppStates {}

class InsertTaskState extends AppStates {}

class GetTaskState extends AppStates {}

class GetThisDayTaskState extends AppStates {}

class RemoveTaskState extends AppStates {}

class OnLoadingState extends AppStates {}

class UpdateTaskState extends AppStates {}

class UpdateFavTaskState extends AppStates {}
