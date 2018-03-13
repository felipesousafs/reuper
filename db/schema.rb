# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180305134252) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alimentos", force: :cascade do |t|
    t.string "ativo"
    t.integer "codAlimento"
    t.integer "codAlimentoOrigem"
    t.string "descricaoOrigem"
    t.string "tabelaNutricionalOrigem"
    t.string "descricaoOriginal"
    t.integer "codUsuario"
    t.string "descricao"
    t.string "codUnidade"
    t.string "observacao"
    t.integer "codAlimentoGrupo"
    t.integer "codAlimentoCategoria"
    t.float "coeficienteNpu"
    t.string "grupoDescricao"
    t.string "categoriaDescricao"
    t.string "marcaDescricao"
    t.integer "codUnidadeCaseira"
    t.integer "tabelaNutricional"
    t.string "unidadeCaseiraDescricao"
    t.string "unidadeCaseiraDescricaoPlural"
    t.integer "porcao"
    t.integer "porcaoQuantidade"
    t.integer "vrc"
    t.float "caloriavrc"
    t.float "energiavrc"
    t.datetime "dataInclusao"
    t.datetime "dataAlteracao"
    t.integer "codRotulo"
    t.string "guid"
    t.string "precoCusto"
    t.string "fatorCorrecao"
    t.string "dataPrecoCusto"
    t.string "ingredientes"
    t.integer "temDiferenca"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "nutrientes", default: "{}", null: false
    t.index ["nutrientes"], name: "index_alimentos_on_nutrientes", using: :gin
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "informacao_nutricionals", force: :cascade do |t|
    t.float "caloria"
    t.float "energia"
    t.float "choQuantidade"
    t.float "choCaloria"
    t.float "ptnQuantidade"
    t.float "ptnCaloria"
    t.float "gordQuantidade"
    t.float "gordCaloria"
    t.float "alcQuantidade"
    t.float "alcCaloria"
    t.float "outroscaloria"
    t.bigint "alimento_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alimento_id"], name: "index_informacao_nutricionals_on_alimento_id"
  end

  create_table "marcadors", force: :cascade do |t|
    t.integer "cod_marcador"
    t.string "classe"
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nutrientes", force: :cascade do |t|
    t.string "descricao"
    t.string "simbolo"
    t.string "codUnidade"
    t.integer "codNutrienteNutriente"
    t.integer "fatorDefault"
    t.integer "ordem"
    t.integer "cor"
    t.integer "codAlimento"
    t.integer "codNutriente"
    t.string "principal"
    t.integer "fator"
    t.float "quantidade"
    t.integer "codNutrienteGrupo"
    t.string "descricaoGrupo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "alimento_id"
    t.index ["alimento_id"], name: "index_nutrientes_on_alimento_id"
  end

  create_table "receita", force: :cascade do |t|
    t.integer "cod_alimento"
    t.string "descricao"
    t.string "ativo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "number"
    t.string "floor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trashes", force: :cascade do |t|
    t.datetime "when"
    t.integer "user_id"
    t.boolean "done"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "reg_number"
    t.string "name"
    t.integer "course_id"
    t.integer "room_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "informacao_nutricionals", "alimentos"
  add_foreign_key "nutrientes", "alimentos"
end
