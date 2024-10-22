#!/bin/bash

# 定义Jekyll命令的前缀
jekyll_cmd="bundle exec jekyll"

function show_menu() {
    echo "Please select an option:"
    echo "1) Start Jekyll project"
    echo "2) Test Jekyll project"
    echo "3) Create new post"
    echo "4) Create new page"
    echo "5) Create new draft"
    echo "6) Exit"
}

function create_new_post() {
    read -r -p "Enter the name of the new post: " name
    if [ -z "$name" ]; then
      echo "Post name cannot be empty."
      return
    fi
    echo "Creating new post: $name"
    $jekyll_cmd compose "$name" --post
}

function create_new_page() {
    read -r -p "Enter the name of the new page: " name
    if [ -z "$name" ]; then
      echo "Page name cannot be empty."
      return
    fi
    echo "Creating new page: $name"
    $jekyll_cmd page "$name"
}

function create_new_draft() {
    read -r -p "Enter the name of the new draft: " name
    if [ -z "$name" ]; then
      echo "Draft name cannot be empty."
      return
    fi
    echo "Creating new draft: $name"
    $jekyll_cmd draft "$name"
}

while true
do
    show_menu
    read -r -p "Enter your choice [1-6]: " choice
    case $choice in
        1) ./tools/run.sh ;;
        2) ./tools/test.sh ;;
        3) create_new_post ;;
        4) create_new_page ;;
        5) create_new_draft ;;
        6) echo "Exiting."; exit 0 ;;
        *) echo "Invalid option. Please try again." ;;
    esac
done
