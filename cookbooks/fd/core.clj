(def pkg-name
  (case (dad/os-type)
    "mac" "fd"
    "fd-find"))

(package pkg-name)
