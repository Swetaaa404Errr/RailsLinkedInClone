# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_230_301_054_329) do
  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.integer 'record_id', null: false
    t.integer 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.string 'service_name', null: false
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'active_storage_variant_records', force: :cascade do |t|
    t.integer 'blob_id', null: false
    t.string 'variation_digest', null: false
    t.index %w[blob_id variation_digest], name: 'index_active_storage_variant_records_uniqueness', unique: true
  end

  create_table 'add_networks', force: :cascade do |t|
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'admins', force: :cascade do |t|
    t.string 'email', null: false
    t.string 'password_digest'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'applies', force: :cascade do |t|
    t.string 'cv'
    t.integer 'job_navigation_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['job_navigation_id'], name: 'index_applies_on_job_navigation_id'
  end

  create_table 'chats', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'room_id', null: false
    t.text 'content'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['room_id'], name: 'index_chats_on_room_id'
    t.index ['user_id'], name: 'index_chats_on_user_id'
  end

  create_table 'comment_posts', force: :cascade do |t|
    t.string 'body', null: false
    t.integer 'job_navigation_id', null: false
    t.integer 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['job_navigation_id'], name: 'index_comment_posts_on_job_navigation_id'
    t.index ['user_id'], name: 'index_comment_posts_on_user_id'
  end

  create_table 'conversations', force: :cascade do |t|
    t.integer 'sender_id'
    t.integer 'recipient_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'followability_relationships', force: :cascade do |t|
    t.string 'followerable_type', null: false
    t.integer 'followerable_id', null: false
    t.string 'followable_type', null: false
    t.integer 'followable_id', null: false
    t.integer 'status'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[followable_type followable_id], name: 'index_followability_relationships_on_followable'
    t.index %w[followerable_type followerable_id], name: 'index_followability_relationships_on_followerable'
  end

  create_table 'friends', force: :cascade do |t|
    t.integer 'sending_id'
    t.integer 'sender_id'
    t.integer 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['sender_id'], name: 'index_friends_on_sender_id'
    t.index ['sending_id'], name: 'index_friends_on_sending_id'
    t.index %w[user_id created_at], name: 'index_friends_on_user_id_and_created_at'
    t.index ['user_id'], name: 'index_friends_on_user_id'
  end

  create_table 'job_fields', force: :cascade do |t|
    t.string 'jobsection'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'job_navigations', force: :cascade do |t|
    t.string 'jobtitle'
    t.string 'jobdescription'
    t.string 'novac'
    t.string 'skill'
    t.string 'jobrole'
    t.string 'jobsector'
    t.integer 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.boolean 'is_approved', default: false
    t.integer 'cached_votes_total', default: 0
    t.integer 'cached_votes_score', default: 0
    t.integer 'cached_votes_up', default: 0
    t.integer 'cached_votes_down', default: 0
    t.integer 'cached_weighted_score', default: 0
    t.integer 'cached_weighted_total', default: 0
    t.float 'cached_weighted_average', default: 0.0
    t.index %w[user_id created_at], name: 'index_job_navigations_on_user_id_and_created_at'
    t.index ['user_id'], name: 'index_job_navigations_on_user_id'
  end

  create_table 'job_positions', force: :cascade do |t|
    t.string 'jobdesignation', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'likes', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'job_navigation_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['job_navigation_id'], name: 'index_likes_on_job_navigation_id'
    t.index %w[user_id job_navigation_id], name: 'index_likes_on_user_id_and_job_navigation_id', unique: true
    t.index ['user_id'], name: 'index_likes_on_user_id'
  end

  create_table 'oauth_accounts', force: :cascade do |t|
    t.integer 'user_id'
    t.string 'provider'
    t.string 'uid'
    t.string 'image_url'
    t.string 'profile_url'
    t.string 'access_token'
    t.text 'raw_data'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_oauth_accounts_on_user_id'
  end

  create_table 'participants', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'room_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['room_id'], name: 'index_participants_on_room_id'
    t.index ['user_id'], name: 'index_participants_on_user_id'
  end

  create_table 'reviews', force: :cascade do |t|
    t.string 'reviewer'
    t.text 'body'
    t.integer 'job_navigation_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['job_navigation_id'], name: 'index_reviews_on_job_navigation_id'
  end

  create_table 'rooms', force: :cascade do |t|
    t.string 'name'
    t.boolean 'is_private'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.boolean 'private', default: false
  end

  create_table 'texts', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.text 'content'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_texts_on_user_id'
  end

  create_table 'triels', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'user_account_attachments', force: :cascade do |t|
    t.integer 'user_account_id'
    t.string 'certificate'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'user_accounts', force: :cascade do |t|
    t.string 'username'
    t.string 'gmail'
    t.string 'link'
    t.string 'qualificatioon'
    t.string 'expericencee'
    t.string 'orgganisation'
    t.string 'skiill'
    t.string 'notify'
    t.integer 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.binary 'cv'
    t.binary 'picture'
    t.binary 'certificate'
    t.boolean 'notification'
    t.string 'job'
    t.string 'cvdownload'
    t.string 'bio'
    t.binary 'user_certificates'
    t.index %w[user_id created_at], name: 'index_user_accounts_on_user_id_and_created_at'
    t.index ['user_id'], name: 'index_user_accounts_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', null: false
    t.string 'password_digest'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.boolean 'admin', default: false
    t.string 'username'
    t.string 'provider'
    t.string 'uid'
    t.string 'first_name'
    t.string 'last__name'
    t.string 'picture_url'
  end

  create_table 'votes', force: :cascade do |t|
    t.string 'votable_type'
    t.integer 'votable_id'
    t.string 'voter_type'
    t.integer 'voter_id'
    t.boolean 'vote_flag'
    t.string 'vote_scope'
    t.integer 'vote_weight'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[votable_id votable_type vote_scope],
            name: 'index_votes_on_votable_id_and_votable_type_and_vote_scope'
    t.index %w[votable_type votable_id], name: 'index_votes_on_votable_type_and_votable_id'
    t.index %w[voter_id voter_type vote_scope], name: 'index_votes_on_voter_id_and_voter_type_and_vote_scope'
    t.index %w[voter_type voter_id], name: 'index_votes_on_voter_type_and_voter_id'
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'active_storage_variant_records', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'applies', 'job_navigations'
  add_foreign_key 'chats', 'rooms'
  add_foreign_key 'chats', 'users'
  add_foreign_key 'comment_posts', 'job_navigations'
  add_foreign_key 'comment_posts', 'users'
  add_foreign_key 'friends', 'users'
  add_foreign_key 'job_navigations', 'users'
  add_foreign_key 'likes', 'job_navigations'
  add_foreign_key 'likes', 'users'
  add_foreign_key 'oauth_accounts', 'users'
  add_foreign_key 'participants', 'rooms'
  add_foreign_key 'participants', 'users'
  add_foreign_key 'reviews', 'job_navigations'
  add_foreign_key 'texts', 'users'
  add_foreign_key 'user_accounts', 'users'
end
