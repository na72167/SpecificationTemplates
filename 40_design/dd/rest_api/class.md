# Entity Layout

<!--
参考元 Javaソースと見るUML入門
http://objectclub.jp/technicaldoc/uml/java2uml
参考元 【新人教育 資料】第3章 UMLまでの道 〜図種類紹介とクラス図の解説編〜
https://qiita.com/devopsCoordinator/items/213e45694dfac0edcfbc
【新人教育 資料】第4章 UMLまでの道 〜クラス図を書いてみよう編〜
https://qiita.com/devopsCoordinator/items/8d2af381c1c469103459
-->

## Overview
- 本ドキュメントは、クラス図について記載する。

### Class description
<!-- Class description [クラス図] -->

```uml
@startuml

''''''''''''''''''''''''''''''''''
' Layout settings                '
''''''''''''''''''''''''''''''''''
!define METAL #F2F2F2-D9D9D9

'''''''''''''''''''''''''
' Class description     '
'''''''''''''''''''''''''

class Dummy {
  String data
  void methods()
}

class Flight {
  flightNumber : Integer
  departureTime : Date
}

'''''''''''''''''''''''
' Relation definition '
'''''''''''''''''''''''
Dummy -- Flight

@enduml
```