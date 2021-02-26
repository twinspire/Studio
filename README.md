# Twinspire Studio
Twinspire Studio is an integrated editor for anything made with Twinspire. You can hook Studio with any Kha project, even Kha projects that don't actually use Twinspire, though using Twinspire is recommended.

This is currently a work-in-progress and should not be used for any serious projects right at this time.

## How it Works
The Studio can either operate as a standalone editor or integrated into your game. If integrated, the macro code is generated from files put together when you use the editor.

This means that whether you enable or disable the editor, all progress made will either be saved as files on the disk or macro-generated into your source files, respectively.

It is also why it is important to have `@:build(twinspire.macros.Studio.build())` regardless of whether you intend to use it or not, to ensure all the files ever created are generated in place.

## Licensing
This is currently open source and licensed under MIT.

Some features of this editor may be created separately and licensed separately.