resource "google_storage_bucket" "old_videos" {

  name = "old_videos"
  storage_class = "COLDLINE"
}

resource "google_storage_bucket" "itunes_backup" {

  name = "itunes_library_backup"
  storage_class = "COLDLINE"
}

resource "google_storage_bucket" "photos_archive" {

  name = "photos_archive"
  storage_class = "COLDLINE"
}