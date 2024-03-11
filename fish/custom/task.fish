function vpe --description "Create new evergreen note"
  touch ~/warehouse/vimwiki/evergreen/$argv.md
  echo tte >> ~/warehouse/vimwiki/evergreen/$argv.md
  lv ~/warehouse/vimwiki/evergreen/$argv.md
end

function vpp --description "Create new project"
  touch ~/warehouse/vimwiki/projects/$argv.md
  echo t >> ~/warehouse/vimwiki/projects/$argv.md
  lv ~/warehouse/vimwiki/projects/$argv.md
end

function vpi --description "Create new project"
  touch ~/warehouse/vimwiki/inbox/$argv.md
  echo ti >> ~/warehouse/vimwiki/inbox/$argv.md
  vpi ~/warehouse/vimwiki/inbox/$argv.md
end


function vvv
    #!/usr/bin/fish
    set search_directory ~/warehouse/vimwiki/projects

    # Use the find command to locate Markdown files
    set files (find $search_directory -type f -name '*.md' | sort)

    set matching_files

    for file in $files
        if cat $file | grep -q 'project' > /dev/null
            if not cat $file | grep -q '\[ \]'
                set matching_files $matching_files $file
            end
        end
    end
    echo $matching_files

    # Extract and print the filenames without extensions
    rm ~/warehouse/vimwiki/empty_projects.md
    rm /tmp/projects.md

    for file in $matching_files
        set filename (basename $file .md)
        echo [[/projects/$filename|$filename]] >> /tmp/projects.md
    end
    shuf /tmp/projects.md >> ~/warehouse/vimwiki/empty_projects.md
    v ~/warehouse/vimwiki/empty_projects.md
end


function aaa
    #!/usr/bin/fish

    set search_directory ~/warehouse/vimwiki/projects

    # Use the find command to locate Markdown files
    set files (find $search_directory -type f -name '*.md' | sort)

    set matching_files

    for file in $files
        if cat $file | grep -q 'project' > /dev/null
            if cat $file | grep -q '\[ \]'
                set matching_files $matching_files $file
            end
        end
    end
    echo $matching_files

    # Extract and print the filenames without extensions
    rm ~/warehouse/vimwiki/active_projects.md
    rm /tmp/projects.md
    echo = Active Projects = >> ~/warehouse/vimwiki/active_projects.md

    for file in $matching_files
        set filename (basename $file .md)
        echo [[/projects/$filename|$filename]] >> /tmp/projects.md
    end
    shuf /tmp/projects.md >> ~/warehouse/vimwiki/active_projects.md
    v ~/warehouse/vimwiki/active_projects.md
end
