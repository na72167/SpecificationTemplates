# Entity Layout
# Entity Layout

<!-- TOC -->
<!-- HTMLファイルのID属性に沿って移動させている。 -->

- [Entity Layout](#db-entity-layout)
    - [Overview](#overview)
    - [Transaction tables](#transaction-tables)
        - [オーダーテーブル t_orders ](#torders)

<!-- /TOC -->

## Overview
- 本ドキュメントは、DB の Entity Layout について記載する。

## Transaction tables
- トランザクションテーブルのレイアウトは以下の通りとなる。

### E-R diagram

<!--  Layout settings  色や隠す関係のメソッドを設定している。 -->
<!-- !define・・・定数内はnot nullである事を宣言している。 -->

<!-- Table description [e-r図関係] -->

```uml
@startuml

''''''''''''''''''''''''''''''''''
' Layout settings                '
''''''''''''''''''''''''''''''''''

hide methods
hide stereotypes
!define MAIN_ENTITY #E2EFDA-C6E0B4
!define MAIN_ENTITY_NEW #FCE4D6-F8CBAD
!define METAL #F2F2F2-D9D9D9
!define MASTER_MARK_COLOR AAFFAA
!define TRANSACTION_MARK_COLOR FFAA00
skinparam class {
    BackgroundColor METAL
    BorderColor Black
    ArrowColor Black
}
!define table(x) class x << (T,#FFAAAA) >>
!define primary_key(x) <color:red>x</color>
!define foreign_key(x) <color:blue>x</color>
!define unique(x) <color:green>x</color>

'''''''''''''''''''''''''
' Table description     '
'''''''''''''''''''''''''

entity "Entity01" as e01 {
  *e1_id : number <<MAIN_ENTITY>>
  --
  *name : text
  description : text
}

entity "Entity02" as e02 {
  *e2_id : number <<generated>>
  --
  *e1_id : number <<FK>>
  other_details : text
}

entity "Entity03" as e03 {
  *e3_id : number <<generated>>
  --
  e1_id : number <<FK>>
  other_details : text
}

'''''''''''''''''''''''
' Relation definition '
'''''''''''''''''''''''

e01 ||..o{ e02
e01 |o..o{ e03

@enduml
```

```uml
@startuml

''''''''''''''''''''''''''''''''''
' Layout settings                '
''''''''''''''''''''''''''''''''''
hide methods
hide stereotypes
!define MAIN_ENTITY #E2EFDA-C6E0B4
!define MAIN_ENTITY_NEW #FCE4D6-F8CBAD
!define METAL #F2F2F2-D9D9D9
!define MASTER_MARK_COLOR AAFFAA
!define TRANSACTION_MARK_COLOR FFAA00
skinparam class {
    BackgroundColor METAL
    BorderColor Black
    ArrowColor Black
}
!define table(x) class x << (T,#FFAAAA) >>
!define primary_key(x) <color:red>x</color>
!define foreign_key(x) <color:blue>x</color>
!define unique(x) <color:green>x</color>


'''''''''''''''''''''''''
' Table description     '
'''''''''''''''''''''''''

@enduml
```
company_informations
- 緑はトランザクションテーブル。赤は中間テーブル。

### users
- users (ユーザー情報の管理)

- N/A・・・該当なし
- 同じテーブル内でデータの出し入れがあった際にNullable or NOT NULLの判定が走っているのかを確認。

| Field                 | Type          |Collation             |Nullable or NOT NULL  | Key    | Default           | Extra          |Description                                  |
|:----------------------|:--------------|:---------------------|:---------------------|:-------|:------------------|:---------------|:---------------------------------------------|
| id                    | int(11)       |                      | NOT NULL              | UNIQUE | N/A               | auto_increment |                                              |

- roll

| Value | Description |
|:------|:------------|
| 1     | 管理者       |