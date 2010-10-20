# Rails bundle for Aptana Studio

A bundle to enable related commands in Aptana Studio. Ported from a TextMate bundle.

## Authors

* Modifications by Aptana

### Rails 3.0 contributors

* Kamil Kukura (rake migrate timestamp patch)

### Rails 2.0 features/contributors (copied from CHANGELOG)

* Snippets/Commands for:
  * Tests
    * assert_select (ass)
    * assert_difference/assert_no_difference (asd/asnd)
    * GET+POST test method stubs (defg+defp)
  * Controllers
    * respond_to (rst)
    * REMOVED: render_component snippets
    * loggers - pass a block instead of raw string to save time if logging not used (e.g. production) [thx Stephen Touset]
    * redirect_to for resource paths (rep, repp, renp, renpp)
    * render :update (ru) [thx Simon Jefford]
  * Views
    * form_for (ff)
    * link_to for resource paths (lip, lipp, linp, linpp)
    * <% end -%> (end)
  * Models
    * has_many :though (hmt)
    * association snippets give better defaults (e.g. bt + hm)
    * validates_format_of (vf,vfif) [thx Dean Strelau]
  * Migrations
    * Sexy Migrations now available as "t." snippets [thx Lawrence Pit]
    * Migration classes have own textmate scope
    * Add/Remove Columns - the 'down' statements are in reverse order [thx Lawrence Pit, Daniel Kristensen]
* Language/Syntax
  * New keywords: rescue_from
  * Added rb as a valid Rails file type [thx James Deville]
* Commands
  * html.erb is the default for new templates (backwards compatibility is being worked on too)
* Plugins
  * Footnote
    * footnote-edge uses .erb for templates [thx Stephen Bannasch]

## License

This bundle is licensed under the Textmate license, available here:

* [Textmate license](http://svn.textmate.org/trunk/LICENSE)

## Other Stuff

* You can [report a bug or request a feature here](http://github.com/aptana/rails.ruble/issues)

# TextMate bundle for Ruby on Rails development