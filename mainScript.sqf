private _houses = [];
private _mapObjects = nearestTerrainObjects [[10370, 11510, 0], [], 40000, false];
{
	if !(isClass(configFile >> "CfgBuildings" >> typeOf _x)) then 
	{
		if ((typeOf _x) isKindOf "House") then 
		{
			_houses pushBackUnique (typeOf _x);
			//diag_log format["adding house %1 | pos %2 | typeOf %3",_x, getPosATL _x,typeOf _x];
		};
	};	
} forEach _mapObjects;
private _config = "";
_houses sort true;
{
	private _obj = _x createVehicle [0,0,0];
	private _buildingPos = _obj buildingPos -1;
	if !(_buildingPos isEqualTo []) then 
	{
		diag_log format["No loot positions for house %1 | posns %2",_x, _buildingPos];
		private _formatedBuildingPosn = "";
		{
			private _p = format["{%1,%2,%3}",_x select 0, _x select 1, _x select 2];
			if (_formatedBuildingPosn isEqualTo "") then 
			{
				_formatedBuildingPosn = _p;
			} else {
				_formatedBuildingPosn = _formatedBuildingPosn + format[",%1",_p];
			};
		} forEach _buildingPos;
		_config = _config + format['class %3 {%1     table = "Military";%1     positions[] = {%2};%1};%1',endl,_formatedBuildingPosn,_x];
	};
} forEach _houses;
copyToClipboard _config;
