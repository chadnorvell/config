function dnf-list-user-installed
    dnf repoquery --installed --qf "%{reason},%{name}\n" | awk -F',' '$1 == "User" {print $2}'
end
