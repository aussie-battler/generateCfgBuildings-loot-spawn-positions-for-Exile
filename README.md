# generateCfgBuildings-loot-spawn-positions-for-Exile
A short script to copy loot spawn positions to the clipboard.

You can use this to generate a CfgBuildings config for buildings on any map.
An optional feature is the ability to load an existing CfgBuiildings by loading a specific mission.
Any buildings for which CfgBuilding entries are defined will be ignored.
Paste the script into the code window of the debug tool in the editor.
Press run local and wait a bit.
Past text copied to the clipboard into any text editor.
Update the table entries as you like.
```
hint str [getModelInfo cursorObject, typeOf cursorObject];
copyToClipboard str [getModelInfo cursorObject, typeOf cursorObject];
```
