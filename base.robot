*** Settings ***

Library    AppiumLibrary
Library    XML

#Utils
Resource    android/utils/config.robot
Resource    android/utils/commons.robot

#Pages
Resource    android/pages/TelaInicialPage.robot
Resource    android/pages/GestaoProduto_Page.robot
Resource    android/pages/Backup_Page.robot
Resource    android/pages/Restore_Page.robot
Resource    android/pages/ExportarDados_Page.robot
Resource    android/pages/ImportarDados_Page.robot
