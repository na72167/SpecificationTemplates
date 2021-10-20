# Entity Layout

<!-- TOC -->
<!-- HTMLファイルのID属性に沿って移動させている。 -->

- [Entity Layout](#db-entity-layout)
    - [Overview](#overview)
    - [Transaction tables](#transaction-tables)
        - [](#torders)

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

table(t_orders) <<T,TRANSACTION_MARK_COLOR>> MAIN_ENTITY {
    + primary_key(id): serial
}
table(t_order_attributes) <<T,TRANSACTION_MARK_COLOR>> MAIN_ENTITY {
    + primary_key(id): serial
    - foreign_key(t_order_id): integer
}

'''''''''''''''''''''''
' Relation definition '
'''''''''''''''''''''''

t_orders ||--|{ t_order_attributes

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

- デフォルトの数字など

| Value | Description |
|:------|:------------|
| 1     | 管理者       |