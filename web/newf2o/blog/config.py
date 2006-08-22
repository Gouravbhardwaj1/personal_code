py = {}

###############
# Start Below #
###############
# If your PyBlosxom installation is in a funky place, uncomment
# this next line and point it to your PyBlosxom installation
# directory.
py["codebase"] = "/c/code/web/newf2o/blog"

# What's this blog's title?
py['blog_title'] = "Blog.a.licious"

# What's this blog's description (for outgoing RSS feed)?
py['blog_description'] = "Bill Mill on Python, programming and life"

# What's this blog's author name and email?
py['blog_author'] = "Bill Mill bill.mill@gmail.com"

#for rss2renderer
py['blog_email'] = "bill.mill@gmail.com"

# What's this blog's primary language (for outgoing RSS feed)?
py['blog_language'] = "en"

# Encoding for output. Default is iso-8859-1.
py['blog_encoding'] = "iso-8859-1"

# Where are this blog's entries kept?
py['datadir'] = "/c/code/web/newf2o/blog"

# Where should PyBlosxom log files be kept?
py['logdir'] = "/c/code/web/newf2o/blog/log"

# List of strings with directories that should be ignored (e.g. "CVS")
# ex: py['ignore_directories'] = ["CVS", "temp"]
py['ignore_directories'] = ["log", "Pybloxsom", "plugin", "contrib", "comments"]

# Should I stick only to the datadir for items or travel down the directory
# hierarchy looking for items?  If so, to what depth?
# 0 = infinite depth (aka grab everything), 1 = datadir only, n = n levels down
py['depth'] = 0

# How many entries should I show on the home page?
py['num_entries'] = 10

####### comments config

py['comment_dir'] = "/c/code/web/newf2o/blog/comments"
py['cmt_password'] = "ginger"

####### personal vars

#used in head.html
py['my_site'] = "http://llimllib.f2o.org"

#DEBUG ONLY
#py['renderer'] = "debug"

py['defaultFlavour'] = "html"

#PLUGIN VARS
py['keyword_trigger'] = "keyword"

py['meta_dir'] = "/c/code/web/newf2o/blog/meta"
py['all_keywords'] = 1
py['keyword_len'] = 20

###########################
# Optional Configurations #
###########################

# What should this blog use as its base url?
py['base_url'] = "http://localhost/newf2o/blog/serve"

# Default parser/preformatter. Defaults to plain (does nothing)
#py['parser'] = 'plain'

# Using Caching? Caching speeds up rendering the page that is going to be
# shown. Even if you are not using pyblosxom special features, caching can
# improve rendering speed of certain flavours that can show a large number of
# files at one time. Choose a cache mechanism you'd like, see the
# Pyblosxom/cache/ directory, and read the source on how to enable caching with
# the particular cache driver, you need to set two variables:
#py['cacheDriver'] = 'xxxx'
#py['cacheConfig'] = ''

# Plugin directories:
# You can now specify where you plugins all lives, there are two types
# of plugindirectories, the standard pyblosxom plugins, and the xmlrpc
# plugins.  You can list out as many directories you want, but they
# should only contain the related plugins.
# Example: py['plugin_dirs'] = ['/opt', '/usr/bin']
py['plugin_dirs'] = ['/c/code/web/newf2o/blog/plugins']

# There are two ways for PyBlosxom to load plugins.  The first is the
# default way which involves loading all the plugins in the lib/plugins
# directory in alphanumeric order.  The second is by specifying a
# "load_plugins" key here.  Doing so will cause us to load only the
# plugins you name and we will load them in the order you name them.
# The "load_plugins" key is a list of strings where each string is
# the name of a plugin module (i.e. the filename without the .py at
# the end).
# ex: py['load_plugins'] = ["pycalendar", "pyfortune", "pyarchives"]
py['load_plugins'] = ["comments", "meta", "keywords", "metatime", "rss2renderer", "commentAdmin"]


# Doing static rendering?  Static rendering essentially "compiles" your
# blog into a series of static html pages.  For more details, read:
# http://wiki.subtlehints.net/moin/PyBlosxom_2fStaticRendering
# 
# What directory do you want your static html pages to go into?
#py["static_dir"] = "/path/to/static/dir"

# What flavours shouldt get generated?
#py["static_flavours"] = ["html"]

# What other paths should we statically render?
# This is for additional urls handled by other plugins like the booklist
# and plugin_info plugins.  If there are multiple flavours you want
# to capture, specify each:
# ex: py["static_urls"] = ["/booklist.rss", "/booklist.html"]
#py["static_urls"] = ["/path/to/url1", "/path/to/url2"]

# Whether (1) or not (0) you want to create date indexes using month
# names?  (ex. /2004/Apr/01)  Defaults to 1 (yes).
#py["static_monthnames"] = 1
# Whether (1) or not (0) you want to create date indexes using month
# numbers?  (ex. /2004/04/01)  Defaults to 0 (no).
#py["static_monthnumbers"] = 0

###########################
# Nothing to modify below #
###########################
__author__ = 'Wari Wahab <wari at wari dot per dot sg>'
__version__ = "CVS"
__date__ = "$Date: 2004/05/20 21:45:38 $"
__revision__ = "$Revision: 1.13 $"
__copyright__ = "Copyright (c) 2003-2004 Wari Wahab"
__license__ = "MIT License"
py['pyblosxom_version'] = __version__
py['pyblosxom_name'] = 'pyblosxom'
