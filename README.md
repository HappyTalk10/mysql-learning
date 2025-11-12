# MySQL学習環境

GitHub Codespacesで動作するMySQL学習用リポジトリです。社員表と部署表を使ってSQLの基本操作を学習できます。

## 📋 テーブル構成

### 部署表（departments）
| カラム名 | データ型 | 制約 | 説明 |
|---------|---------|------|------|
| department_id | INT | PRIMARY KEY | 部署番号 |
| department_name | VARCHAR(100) | NOT NULL | 部署名 |

### 社員表（employees）
| カラム名 | データ型 | 制約 | 説明 |
|---------|---------|------|------|
| employee_id | INT | PRIMARY KEY | 社員番号 |
| name | VARCHAR(100) | NOT NULL | 氏名 |
| gender | ENUM | NOT NULL | 性別（男/女/その他） |
| birth_date | DATE | NOT NULL | 生年月日 |
| salary | DECIMAL(10,2) | NOT NULL | 給与 |
| department_id | INT | FOREIGN KEY | 部署番号 |

## 🚀 セットアップ

### 1. Codespacesを起動

1. このリポジトリで「Code」ボタンをクリック
2. 「Codespaces」タブを選択
3. 「Create codespace on main」をクリック
4. 数分待つと自動的にMySQLとテーブルが作成されます

### 2. MySQLに接続

ターミナルで以下のコマンドを実行：

```bash
mysql -h db -u root -ppassword company_db
```

## 💡 基本的な使い方

### テーブル確認

```sql
-- テーブル一覧
SHOW TABLES;

-- 社員データを表示
SELECT * FROM employees;

-- 部署データを表示
SELECT * FROM departments;
```

### データ検索

```sql
-- 給与が35万円以上の社員
SELECT * FROM employees WHERE salary >= 350000;

-- 開発部の社員
SELECT e.* 
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = '開発部';

-- 名前に「田」を含む社員
SELECT * FROM employees WHERE name LIKE '%田%';
```

### データ集計

```sql
-- 部署別の社員数
SELECT 
    d.department_name,
    COUNT(e.employee_id) as employee_count
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name;

-- 部署別の平均給与
SELECT 
    d.department_name,
    AVG(e.salary) as average_salary,
    MIN(e.salary) as min_salary,
    MAX(e.salary) as max_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name;
```

### 結合クエリ

```sql
-- 社員と部署を結合して表示
SELECT 
    e.employee_id,
    e.name,
    e.gender,
    e.birth_date,
    e.salary,
    d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;
```

## 📝 練習問題

### 初級
1. 全社員の名前と給与を表示してください
2. 営業部の社員を表示してください
3. 給与が40万円以上の社員を表示してください

### 中級
4. 各部署の平均給与を計算してください
5. 最も給与が高い社員を表示してください
6. 1990年以降生まれの社員を表示してください

### 上級
7. 部署ごとの給与合計を降順で表示してください
8. 各部署で最も給与が高い社員を表示してください
9. 社員がいない部署を表示してください

## 🛠️ ターミナルから直接実行

MySQLプロンプトに入らずに、ターミナルから直接SQLを実行することもできます：

```bash
# テーブル一覧
mysql -h db -u root -ppassword company_db -e "SHOW TABLES;"

# 全社員表示
mysql -h db -u root -ppassword company_db -e "SELECT * FROM employees;"

# 複雑なクエリも実行可能
mysql -h db -u root -ppassword company_db -e "
SELECT d.department_name, COUNT(*) as count
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name;"
```

## 📚 学習リソース

- [MySQL公式ドキュメント](https://dev.mysql.com/doc/)
- [SQL基礎文法](https://www.w3schools.com/sql/)

## 🔧 接続情報

- **ホスト**: db
- **ユーザー**: root
- **パスワード**: password
- **データベース**: company_db
- **ポート**: 3306

## 📂 ファイル構成

```
mysql-learning/
├── .devcontainer/
│   ├── devcontainer.json    # Codespaces設定
│   └── docker-compose.yml   # Docker構成
├── setup.sql                # 初期データ
└── README.md               # このファイル
```

## ⚠️ 注意事項

- このリポジトリは学習用です。本番環境では使用しないでください
- パスワードは簡易的なものです。実際の開発では安全なパスワードを使用してください
- Codespacesを停止すると、データは保持されますが、削除すると全てリセットされます

## 📄 ライセンス

このプロジェクトは学習目的で自由に使用できます。
