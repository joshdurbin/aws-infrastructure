resource "google_storage_bucket" "old_videos" {
  name          = "old_videos"
  storage_class = "COLDLINE"
}

resource "google_storage_bucket" "itunes_backup" {
  name          = "itunes_library_backup"
  storage_class = "COLDLINE"
}

resource "google_storage_bucket" "photos_archive" {
  name          = "photos_archive"
  storage_class = "COLDLINE"
}

resource "google_storage_bucket" "ebooks_archive" {
  name          = "ebooks_archive"
  storage_class = "COLDLINE"
}

resource "aws_s3_bucket" "email_archive" {
  bucket = "durbinjo593-gmail-archive"
  acl    = "private"
}

resource "aws_s3_bucket" "chats_archive" {
  bucket = "durbinjo593-gmail-chats-archive"
  acl    = "private"
}

resource "aws_s3_bucket" "documents_archive" {
  bucket = "platypus-documents-archive"
  acl    = "private"
}
