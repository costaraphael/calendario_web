# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150216205453) do

  create_table "calendarios", force: :cascade do |t|
    t.integer  "campus_id",  limit: 4
    t.string   "nome",       limit: 255
    t.datetime "vigencia"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "calendarios", ["campus_id"], name: "index_calendarios_on_campus_id", using: :btree

  create_table "campi", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.string   "sigla",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "evento_tipos", force: :cascade do |t|
    t.string   "nome",           limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "tem_dia_semana", limit: 1
    t.boolean  "tem_descricao",  limit: 1
    t.boolean  "tem_periodo",    limit: 1
  end

  create_table "eventos", force: :cascade do |t|
    t.integer  "calendario_id",  limit: 4
    t.integer  "evento_tipo_id", limit: 4
    t.date     "inicio"
    t.date     "fim"
    t.integer  "dia_semana",     limit: 4
    t.text     "descricao",      limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "eventos", ["calendario_id"], name: "index_eventos_on_calendario_id", using: :btree
  add_index "eventos", ["evento_tipo_id"], name: "index_eventos_on_evento_tipo_id", using: :btree

  add_foreign_key "calendarios", "campi"
  add_foreign_key "eventos", "calendarios"
  add_foreign_key "eventos", "evento_tipos"
end
