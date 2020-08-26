# Database blueprint

- [Process](#process)
- [Models](#models)
 + [Bookmarks](#bookmarks)
 + [Fundings](#fundings)
 + [Messages](#messages)
 + [Projects](#projects)
 + [Users](#users)

## <a name="process">Process</a>
1. generate model with table names and references
```rb
rails g model ModelName column_name:type_of_data other_model:references
```

2. Add Associations and Validations to Models
- associations
  + owner:
   - has many projects
  + investor:
   - has many fundings
   - has many bookmarks
  + bookmark
   - belongs to investor
   - belongs to project
  + funding
   - belongs to investor
   - belongs to project
  + project
   - belongs to owner
   - belongs to bookmark
   - has many fundings

- Validations
 + presence
 + uniqueness

```rb
# associations
# complex add_many for user model with many projects
has_many :projects_as_owner, :class_name => 'Project', :foreign_key => 'owner_id', dependent: :destroy
belongs_to
# complex belongs_to for project belonging to a user
belongs_to :owner, :class_name => 'User'
# Validations
presence: true
uniqueness: true
```

3. Edit migration created by the generation of the model, if needed, to specify foreign key name
```rb
t.references :new_name_of_foreign_key_reference, null: false, foreign_key: { to_table: :table_name }
```

4. Migrate
```rb
rails db:migrate
```

5. Run tests with hand-made seeds
```rb
rails c --sandbox
Bookmark.new(investor_id: integer, project_id: integer)
Funding.new(investor_id: integer, funding_share: integer, funding_amount: integer, accepted?: boolean)
Project.new(name: string, total_funding: integer, total_shares: integer, open?: boolean, category: string, owner_id: integer)
User.new(first_name: string, last_name: string, username: string, email: string, role: string, password: string)
```
- Users(id, first_name, last_name, user_name. email, role )
  - 1, Eukleyv. Cardoso, kleyv, kleyv@gmail.com, owner
  - 2, Florian, Ott, flo, flo@gmail.com, owner
  - 3, Raffaelle, Virgiani, raffoz, raffoz@gmail.com, investor
  - 4, Tiago, Palhoça, tiago, tiago@gmail.com, investor

- Projects(name, total_funding, total_shares, open?. category, owner_id)
  - 1, apple, 15_000. 1000. open, technology, 2
  - 2, kfc, 20_000, 1000, true, food, 1

## <a name="models">Models</a>

### <a name="bookmarks">Bookmarks</a>

| id  |  investor_id | project_id  |
|---|---|---|
| 1  | 3  | 14   |

### Model
```rb
class Bookmark < ApplicationRecord
  # assign foreign key coming from users table and rename it to investor so we get a investor_id table
  belongs_to :investor, :class_name => 'User'
  belongs_to :project
end
```
### Migration
```rb
class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      # specify name of the column in the reference so that they don't take the default value of user_id
      t.references :investor, null: false, foreign_key: { to_table: :users }
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
```

## <a name="fundings">Fundings</a>

| id  | investor_id  |  project_id | founding_share  | funding_amount | accpted?  |
|---|---|---|---|---|---|
| 1  | 234  | 423   | 20  | 157  | true   |

### Model
```rb

class Funding < ApplicationRecord
  belongs_to :projectApplicationRecord
  # assign foreign key coming from users table and rename it to investor so we get a investor_id table
  belongs_to :investor, :class_name => 'User'
end
```
### Migration
```rb
class CreateFundings < ActiveRecord::Migration[6.0]
  def change
    create_table :fundings do |t|
      t.integer :funding_amount
      t.integer :funding_shares
      t.references :project, null: false, foreign_key: true
      # specify name of the column in the reference so that they don't take the default value of user_id
      t.references :investor, null: false, foreign_key: { to_table: :users }
      t.boolean :accepted?

      t.timestamps
    end
  end
end
```

## <a name="messages">Messages</a>

| id  | subject  |  content | owner_id  | investor_ |
|---|---|---|---|---|
| 1  | Sent you an offer  | I'd like to help you fund your project   | 35  |784  |

### Model
```rb
class Bookmark < ApplicationRecord
end
```
### Migration
```rb
class Project < ApplicationRecord
end
```

## <a name="projects">Projects</a>

| id  | name  |  total_funding | total_share  | open? | category  | owner_id  |
|---|---|---|---|---|---|---|
| 1  | falcony  | 20_000   | 1000  | true  | technology   | 1   |

### Model
```rb
class Project < ApplicationRecord
  # assign foreign key coming from users table and rename it to owner so we get a owner:id table
  belongs_to :owner, :class_name => 'User'
  has_many :fundings
  has_many :bookmarks

  validates :name, :category, :total_funding, :total_share, :owner_id, presence: true
  validates :name, uniqueness: true
end
```
### Migration
```rb
class Project < ApplicationRecord
  # assign foreign key coming from users table and rename it to owner so we get a owner:id table
  belongs_to :owner, :class_name => 'User'
  has_many :fundings
  has_many :bookmarks

  validates :name, :category, :total_funding, :total_share, :owner_id, presence: true
  validates :name, uniqueness: true
end
```

### <a name="users">Users</a>

| id  | first_name  |  last_name | user_name  | email | role  |
|---|---|---|---|---|---|
| 1  | Eukleyv  | Cardoso   | kleyv  | kleyv@gmail.com  | owner   |

#### Model - provided by devise gem
```rb
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # specify name of the coluns that receive foreing key so that they don't take the default value of user_id
  has_many :projects_as_owner, :class_name => 'Project', :foreign_key => 'owner_id', dependent: :destroy
  has_many :fundings_as_investor, :class_name => 'Funding', :foreign_key => 'investor_id', dependent: :destroy
  has_many :bookmarks_as_investor, :class_name => 'Bookmark', :foreign_key => 'investor_id', dependent: :destroy

  validates :first_name, :last_name, :username, :email, :role, presence: true
  validates :username, uniqueness: true
end
```
#### Migration
```rb
class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :total_funding
      t.integer :total_share
      t.string :open?
      t.string :category
      # specify name of the column in the reference so that they don't take the default value of user_id
      t.references :owner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
```
