# Rake Report

Create a rake task which lists a directories contents and filters the output to a given pattern.

The script should be called like this:

```
rake list[path,pattern]
```

E.g:

```
rake list[/path/to/directory,*.png]
```

The script should be defined in a `Rakefile` and the second parameter should be optional. If omitted, the script should list all files in the directory.

The output should look like this:

```
light.png
lightning.png
lightpost.png
smile.jpg
solar_system.jpg
solutions.png
star-tunnel.png
summer_cloud.jpg
summer_grass.jpg
tabula-rasa.png
teal-pixels.jpg
```

You should also spend some time testing your task using what you've learnt in previous exercises. How would you test calling the Rake task? Can you break it?
