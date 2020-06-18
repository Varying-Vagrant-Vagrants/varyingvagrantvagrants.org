---
category: 6. Reference
order: 12
title: Debugging with xdebug and PhpStorm
permalink: /docs/en-US/references/xdebug-and-phpstorm/
---

The basic idea in PhpStorm is that you tell it where to look for the xdebug session (the "server") and then you tell it how to link the files it's running in the VM to the files found in the repo (called "mapping").

_What follows are opinionated defaults, so adjust as you deem necessary. Specifically, the PHP versions you'll be supporting_

## Confirm PhpStorm's project setup

Make sure you have your project folders already set up in phpStorm.

1. Open preferences in the main menu, and navigate to the Directories section
2. Make sure your project's content root is set
3. Click *Languages & Frameworks*, PHP and fill it in like this
   - Set the PHP language level to match the site you're debugging.
   - CLI Interpreter: select one if you have it, leave it as `<no interpreter>` if you don't
   - Include Path section: add the path to the locally-mapped `public_html` folder of the VM for you project

## Set up the Server

This is not a server in the sense of an actual server, more like the settings on how to connect to the VVV server already set up.

1. In the default toolbar, you'll see a select box that has either "Add Configuration..." (if you haven't set up debugging for another project) or "Edit configurations..." (if you have). Whatever it says, click it. 
    - If you don't see this item in your toolbar, add it in by customizing the toolbar. You'll thank me later. 

2. Click the + sign top left and select *PHP Remote Debug* and fill it in using the following settings:
    - Name: `<your project name>` Debug
    - Filter debug connection by IDE key: enabled
    - Server: skip for now
    - IDE Key: `VVVDEBUG`
3. Click Apply and keep clicking Apply until you're back in the editor.

## Set up the Folder Mapping

For PhpStorm and xdebug to correctly hit breakpoints and talk to each other, we need to tell PhpStorm how the files it knows about are mapped to the files that VVV knows about.

There is a way to get the server going manually but there is an easier way: get PhpStorm to do the important bits for us. Here's how.

1. [Turn on XDebug inside the VM](xdebug.md)
2. Start listening for connections in PhpStorm by clicking the small telephone icon
3. Load a VM page in your browser
    - PhpStorm will detect a request to connect, but will complain that path mappings are not set up. This is fine, we're about to do that. But what PhpStorm also does is set up the "Server" configuration for us. Sweet!
4. When you see the "Incoming Connection from Xdebug" window, click "Manually choose local file or project" and then "Accept"
    - At this point, debugging will run and then stop because the mappings are not set up yet, and there are no break points. Time to fix that.
5. In the toolbar, select "Edit Configurations..."
6. On the left side make sure the "<your project name> Debug" config is selected, then click the ellipsis in the "Server:" section
7. Look at the server already set up for us. Thanks PhpStorm. Now to do the mapping.
    - The key to remember here is that we are mapping the files from where they are relative to the mapped server folder, to where they are in the code repo as it is linked within the VM.
8. Enable "Use path mappings...." to enable the section below it.
9. Expand "Project files" and then expand the project path. 
10. Fill in the highest-level section you can to capture everything. For simple projects this will likely be a 1:1 mapping, but for complicated nested projects you may not have to map absolutely eveything, only the children
11. Expand "Include Path"
12. Fill in the items below, and **only** the items below, into this section (if it's not already filled in; it should be):

   | File/ Directory| Absolute path on server |
   |---|---|
   | `/path/to/vm/www/<project>/public_html` | `/srv/www/path/to/mapped/folder` |

13. Click Apply until you're back at your code view.

Done. Now once you enable Xdebug, turn on debugging in PhpStorm and set a breakpoint, you're ready to debug.
