REM ***************************************************************************************************************
REM This cmd file is for people who don't want to use ANT (requires Java & ANT) to rebuild the Runtime\Qvc.qvs >>..\Qvc_Runtime\Qvc.qvs file. 
REM Currently, the list of files must be maintained manually. 
REM ****************************************************************************************************************
REM ** Clean out the Qvc_Runtime directory
DEL /S /Q ..\Qvc_Runtime\*.*

REM ** Merge source *.qvs files into a single Qvc.qvs file.
REM ** The reason a wildcard copy can't be used is because TYPE ..\QVC_Source\Qvc_Global.qvs must be first. The remaining files can be copied in any order.
TYPE ..\QVC_Source\Qvc_Global.qvs > ..\Qvc_Runtime\Qvc.qvs
TYPE ..\QVC_Source\Qvc_AsOfTable.qvs >>..\Qvc_Runtime\Qvc.qvs
TYPE ..\QVC_Source\Qvc_Calendar.qvs >>..\Qvc_Runtime\Qvc.qvs
TYPE ..\QVC_Source\Qvc_Cleanup.qvs >>..\Qvc_Runtime\Qvc.qvs
TYPE ..\QVC_Source\Qvc_ColorTheme.qvs >>..\Qvc_Runtime\Qvc.qvs
TYPE ..\QVC_Source\Qvc_DataLineage.qvs >>..\Qvc_Runtime\Qvc.qvs
TYPE ..\QVC_Source\Qvc_DbExtract.qvs >>..\Qvc_Runtime\Qvc.qvs
TYPE ..\QVC_Source\Qvc_EmptyQvd.qvs >>..\Qvc_Runtime\Qvc.qvs
TYPE ..\QVC_Source\Qvc_ExpandInterval.qvs >>..\Qvc_Runtime\Qvc.qvs
TYPE ..\QVC_Source\Qvc_Incremental_Reload.qvs >>..\Qvc_Runtime\Qvc.qvs
TYPE ..\QVC_Source\Qvc_InspectTable.qvs >>..\Qvc_Runtime\Qvc.qvs
TYPE ..\QVC_Source\Qvc_Icons.qvs >>..\Qvc_Runtime\Qvc.qvs
TYPE ..\QVC_Source\Qvc_JoinGenericTables.qvs >>..\Qvc_Runtime\Qvc.qvs
TYPE ..\QVC_Source\Qvc_LinkTable.qvs >>..\Qvc_Runtime\Qvc.qvs
TYPE ..\QVC_Source\Qvc_ListDirectories.qvs >>..\Qvc_Runtime\Qvc.qvs
TYPE ..\QVC_Source\Qvc_ListFiles.qvs >>..\Qvc_Runtime\Qvc.qvs
TYPE ..\QVC_Source\Qvc_Log.qvs >>..\Qvc_Runtime\Qvc.qvs
TYPE ..\QVC_Source\Qvc_PopulateVariables.qvs >>..\Qvc_Runtime\Qvc.qvs
TYPE ..\QVC_Source\Qvc_QvcAvailableUpdate.qvs >>..\Qvc_Runtime\Qvc.qvs
TYPE ..\QVC_Source\Qvc_SegmentedStore.qvs >>..\Qvc_Runtime\Qvc.qvs
TYPE ..\QVC_Source\Qvc_TableStats.qvs >>..\Qvc_Runtime\Qvc.qvs
TYPE ..\QVC_Source\Qvc_Utility.qvs >>..\Qvc_Runtime\Qvc.qvs
TYPE ..\QVC_Source\Qvc_WildMap.qvs >>..\Qvc_Runtime\Qvc.qvs

XCOPY ..\QVC_Source\Language\*.* ..\Qvc_Runtime\Language\*.* /E

@ECHO OFF
set /p=Hit ENTER to Finish
@ECHO ON

