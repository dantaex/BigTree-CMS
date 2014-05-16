SET SESSION foreign_key_checks = 0;
SET SESSION sql_mode = "NO_AUTO_VALUE_ON_ZERO";

INSERT INTO `bigtree_callout_groups` (`id`, `name`) VALUES (1, 'Bottom');
INSERT INTO `bigtree_callouts` (`id`, `name`, `description`, `display_default`, `display_field`, `resources`, `level`, `position`, `group`) VALUES ('flexible', 'Flexible', '', '', 'title', '[{\"id\":\"title\",\"title\":\"Title\",\"subtitle\":\"\",\"type\":\"text\"},{\"id\":\"content\",\"title\":\"Content\",\"subtitle\":\"\",\"type\":\"html\"}]', 0, 0, 1);

INSERT INTO `bigtree_module_actions` (`id`, `module`, `name`, `route`, `in_nav`, `form`, `view`, `report`, `class`, `level`, `position`) VALUES (1, 1, 'View Trees', '', 'on', NULL, 1, NULL, 'list', 0, 0), (2, 1, 'Add Tree', 'add', 'on', 1, NULL, NULL, 'add', 0, 0), (3, 1, 'Edit Tree', 'edit', '', 1, NULL, NULL, 'edit', 0, 0), (4, 2, 'View Quotes', '', 'on', NULL, 2, NULL, 'list', 0, 0), (5, 2, 'Add Quote', 'add', 'on', 2, NULL, NULL, 'add', 0, 0), (6, 2, 'Edit Quote', 'edit', '', 2, NULL, NULL, 'edit', 0, 0);
INSERT INTO `bigtree_module_forms` (`id`, `module`, `title`, `preprocess`, `callback`, `table`, `fields`, `default_position`, `return_view`, `return_url`, `tagging`) VALUES (1, 1, 'Tree', '', '', 'demo_trees', '{\"title\":{\"title\":\"Title\",\"subtitle\":\"\",\"type\":\"text\"},\"subtitle\":{\"title\":\"Subtitle\",\"subtitle\":\"\",\"type\":\"text\"},\"route\":{\"source\":\"title\",\"type\":\"route\",\"title\":\"Route\",\"subtitle\":\"\"},\"content\":{\"title\":\"Content\",\"subtitle\":\"\",\"type\":\"html\"},\"cover\":{\"directory\":\"files\\/trees\\/\",\"image\":\"on\",\"min_width\":\"1200\",\"min_height\":\"600\",\"preview_prefix\":\"thumb_\",\"crops\":{\"1\":{\"prefix\":\"\",\"width\":\"1200\",\"height\":\"600\",\"grayscale\":\"\",\"thumbs\":{\"2\":{\"prefix\":\"large_\",\"width\":\"775\",\"height\":\"\",\"grayscale\":\"\"},\"1\":{\"prefix\":\"thumb_\",\"width\":\"200\",\"height\":\"\",\"grayscale\":\"\"}}}},\"type\":\"upload\",\"title\":\"Cover Photo\",\"subtitle\":\"Min 1200x600px\"},\"cover_attribution\":{\"type\":\"text\",\"title\":\"Cover Attribution\",\"subtitle\":\"\"},\"cover_link\":{\"type\":\"text\",\"title\":\"Cover Link\",\"subtitle\":\"Including \'http:\\/\\/\'\"},\"gallery\":{\"directory\":\"files\\/trees\\/\",\"min_width\":\"275\",\"min_height\":\"275\",\"preview_prefix\":\"thumb_\",\"crops\":{\"1\":{\"prefix\":\"thumb_\",\"width\":\"275\",\"height\":\"275\",\"grayscale\":\"\"}},\"thumbs\":{\"1\":{\"prefix\":\"\",\"width\":\"1200\",\"height\":\"1200\",\"grayscale\":\"\"}},\"type\":\"photo-gallery\",\"title\":\"Photo Gallery\",\"subtitle\":\"Min 275x275px\"},\"link\":{\"type\":\"text\",\"title\":\"External Link\",\"subtitle\":\"Including \'http:\\/\\/\'\"}}', 'Bottom', NULL, '', ''), (2, 2, 'Quote', '', '', 'demo_quotes', '{\"quote\":{\"title\":\"Quote\",\"subtitle\":\"\",\"type\":\"textarea\"},\"author\":{\"title\":\"Author\",\"subtitle\":\"\",\"type\":\"text\"},\"source\":{\"title\":\"Source\",\"subtitle\":\"\",\"type\":\"text\"}}', '', NULL, '', '');
INSERT INTO `bigtree_module_views` (`id`, `module`, `title`, `description`, `type`, `table`, `fields`, `options`, `actions`, `preview_url`) VALUES (1, 1,'Trees', '', 'draggable', 'demo_trees', '{\"title\":{\"title\":\"Title\",\"parser\":\"\",\"width\":788,\"numeric\":false}}', '{\"sort\":\"`date` DESC\",\"per_page\":\"15\",\"filter\":\"\"}', '{\"edit\":\"on\",\"delete\":\"on\"}', ''), (2, 2,'Quotes', '', 'draggable', 'demo_quotes', '{\"quote\":{\"title\":\"Quote\",\"parser\":\"\",\"width\":364,\"numeric\":false},\"author\":{\"title\":\"Author\",\"parser\":\"\",\"width\":364,\"numeric\":false}}', 'null', '{\"approve\":\"on\",\"edit\":\"on\",\"delete\":\"on\"}', '');
INSERT INTO `bigtree_modules` (`id`, `group`, `name`, `route`, `class`, `icon`, `gbp`, `position`) VALUES (1, NULL, 'Trees', 'trees', 'DemoTrees', 'world', '{\"name\":\"\",\"table\":\"\",\"other_table\":\"\"}', 0), (2, NULL, 'Quotes', 'quotes', 'DemoQuotes', 'comments', '{\"name\":\"\",\"table\":\"\",\"other_table\":\"\"}', 0);

DELETE FROM `bigtree_pages`;
INSERT INTO `bigtree_pages` (`id`, `trunk`, `parent`, `in_nav`, `nav_title`, `route`, `path`, `title`, `meta_keywords`, `meta_description`, `seo_invisible`, `template`, `external`, `new_window`, `resources`, `archived`, `archived_inherited`, `publish_at`, `expire_at`, `max_age`, `last_edited_by`, `ga_page_views`, `position`, `created_at`, `updated_at`) VALUES (0, 'on', -1, 'on', 'Trees of All Sizes', '', '', 'Trees of All Sizes', '', '', '', 'home', '', '', '{\"site_subtitle\":\"A Site of Trees\",\"cover_image\":\"https://bigtree-demo-site.s3.amazonaws.com/files\\/pages\\/home-5-aladin.jpg\",\"cover_attribution\":\"Bradley Strong\",\"cover_link\":\"http:\\/\\/freerangestock.com\\/details.php?gid=&amp;sgid=&amp;pid=3380\",\"callouts\":[{\"type\":\"flexible\",\"display_title\":\"The Site\",\"title\":\"The Site\",\"content\":\"<p>This site is a technical demonstration of the open source software product BigTree CMS. We are not tree experts nor do we intend for this site to be used as a factual reference.<br \\/><a href=\\\"ipl:\\/\\/4\\/\\/W10=\\\">Learn More About This Site<\\/a><\\/p>\"}]}', '', '', NULL, NULL, 0, 1, 0, 0, '2013-12-11 19:15:15', '2014-02-11 16:04:55'), (2, '', 0, 'on', 'The Trees', 'trees', 'trees', 'The Trees', '', '', '', 'trees', '', '', '{\"page_header\":\"The Trees\"}', '', '', NULL, NULL, 0, 1, 0, 0, '2013-12-12 13:41:24', '2013-12-13 10:23:59'), (3, '', 0, 'on', 'The Quotes', 'quotes', 'quotes', 'The Quotes', '', '', '', 'quotes', '', '', '{\"page_header\":\"The Quotes\"}', '', '', NULL, NULL, 0, 1, 0, 0, '2013-12-12 14:02:40', '2013-12-13 10:24:07'), (4, '', 0, 'on', 'The Site', 'about', 'about', 'The Site', '', '', '', 'content', '', '', '{\"page_header\":\"About This Site\",\"page_content\":\"<h4>The Site<\\/h4>\\r\\n<p>This site is a technical demonstration of the open source software product BigTree CMS. We are not tree experts nor do we intend for this site to be used as a factual reference.<\\/p>\\r\\n<h4>The CMS<\\/h4>\\r\\n<p>BigTree CMS is an open source content management system built on PHP and MySQL. It was created by user experience and content strategy experts. <br \\/><a href=\\\"http:\\/\\/www.bigtreecms.org\\/\\\" target=\\\"_blank\\\">Learn More About BigTree CMS<\\/a><\\/p>\\r\\n<h4>The Fonts<\\/h4>\\r\\n<p>PT Sans is based on Russian sans serif types of the second part of the 20th century, but at the same time has distinctive features of contemporary humanistic designs. <br \\/><a href=\\\"http:\\/\\/www.google.com\\/fonts\\/specimen\\/PT+Sans\\\" target=\\\"_blank\\\">Download PT Sans<\\/a><\\/p>\\r\\n<p>PT Serif is a transitional serif typeface with humanistic terminals. It is designed for use together with PT Sans, and is harmonized across metrics, proportions, weights and design.<br \\/><a href=\\\"https:\\/\\/www.google.com\\/fonts\\/specimen\\/PT+Serif\\\" target=\\\"_blank\\\">Download PT Serif<\\/a><\\/p>\\r\\n<h4>The Images<\\/h4>\\r\\n<p>Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Curabitur blandit tempus porttitor. Etiam porta sem.<br \\/><a href=\\\"http:\\/\\/www.sxc.hu\\/\\\" target=\\\"_blank\\\">Explore Stock.XCHNG<\\/a><br \\/><a href=\\\"http:\\/\\/freerangestock.com\\/\\\" target=\\\"_blank\\\">Explore Freerange Stock<\\/a><\\/p>\\r\\n<h4>The Text<\\/h4>\\r\\n<p>Etiam porta sem malesuada magna mollis euismod. Maecenas faucibus mollis interdum. Donec sed odio dui. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Donec id elit non mi porta gravida at eget metus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. <br \\/><a href=\\\"http:\\/\\/www.wikipedia.org\\/\\\" target=\\\"_blank\\\">Explore Wikipedia <\\/a><\\/p>\\r\\n<h4>The Quotes<\\/h4>\\r\\n<p>Praesent commodo cursus magna, vel scelerisque nisl consectetur ipsum dolor sit et. Donec id elit non mi porta gravida at eget metus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. <br \\/><a href=\\\"http:\\/\\/www.goodreads.com\\/\\\" target=\\\"_blank\\\">Explore Goodreads<\\/a><\\/p>\"}', '', '', NULL, NULL, 0, 1, 0, 0, '2013-12-12 13:43:17', '2013-12-12 14:17:51');

INSERT INTO `bigtree_settings` (`id`, `value`, `type`, `options`, `name`, `description`, `locked`, `system`, `encrypted`) VALUES ('colophon', X'223C703E4275696C74206F6E203C6120687265663D5C22687474703A5C2F5C2F7777772E62696774726565636D732E6F72675C2F5C22207461726765743D5C225F626C616E6B5C223E4269675472656520434D533C5C2F613E3C5C2F703E22', 'html', '', 'Colophon', '', '', '', ''), ('nav-social', X'7B2230223A7B227469746C65223A22476974487562222C226C696E6B223A2268747470733A5C2F5C2F6769746875622E636F6D5C2F62696774726565636D735C2F426967547265652D434D53222C22636C617373223A22676974687562227D2C2231223A7B227469746C65223A2254776974746572222C226C696E6B223A2268747470733A5C2F5C2F747769747465722E636F6D5C2F62696774726565636D73222C22636C617373223A2274776974746572227D2C2232223A7B227469746C65223A2246616365626F6F6B222C226C696E6B223A2268747470733A5C2F5C2F7777772E66616365626F6F6B2E636F6D5C2F42696754726565436D73222C22636C617373223A2266616365626F6F6B227D7D', 'array', '{\"fields\":[{\"key\":\"title\",\"title\":\"Title\",\"type\":\"text\"},{\"key\":\"link\",\"title\":\"Link (Inlcuding \'http://\')\",\"type\":\"text\"},{\"key\":\"class\",\"title\":\"Class; Service name, lowercsae\",\"type\":\"text\"}]}', 'Nav - Social', '', '', '', '');

DELETE FROM `bigtree_templates`;
INSERT INTO `bigtree_templates` (`id`, `name`, `routed`, `resources`, `module`, `level`, `position`) VALUES ('content', 'Content', '', '[{\"id\":\"page_header\",\"title\":\"Page Header\",\"subtitle\":\"\",\"type\":\"text\",\"validation\":\"\",\"seo_h1\":\"on\",\"sub_type\":\"\",\"wrapper\":\"\",\"name\":\"\"},{\"id\":\"page_content\",\"title\":\"Page Content\",\"subtitle\":\"\",\"type\":\"html\",\"validation\":\"\",\"seo_body\":\"on\",\"wrapper\":\"\",\"name\":\"\"},{\"id\":\"callouts\",\"title\":\"Callouts\",\"subtitle\":\"\",\"type\":\"callouts\",\"group\":\"2\",\"noun\":\"\"}]', 0, 0, 3), ('home', 'Home', '', '[{\"id\":\"site_subtitle\",\"title\":\"Site Subtitle\",\"subtitle\":\"\",\"type\":\"text\"},{\"id\":\"cover_image\",\"title\":\"Cover Photo\",\"subtitle\":\"Min 1200x600px\",\"type\":\"upload\",\"image\":\"on\",\"min_width\":\"1200\",\"min_height\":\"600\",\"preview_prefix\":\"thumb_\",\"crops\":{\"1\":{\"prefix\":\"\",\"width\":\"1200\",\"height\":\"600\",\"grayscale\":\"\",\"thumbs\":{\"2\":{\"prefix\":\"large_\",\"width\":\"775\",\"height\":\"\",\"grayscale\":\"\"},\"1\":{\"prefix\":\"thumb_\",\"width\":\"200\",\"height\":\"\",\"grayscale\":\"\"}}}}},{\"id\":\"cover_attribution\",\"title\":\"Cover Attribution\",\"subtitle\":\"\",\"type\":\"text\"},{\"id\":\"cover_link\",\"title\":\"Cover Link\",\"subtitle\":\"Inlcuding \'http:\\/\\/\'\",\"type\":\"text\"},{\"id\":\"callouts\",\"title\":\"Callouts\",\"subtitle\":\"\",\"type\":\"callouts\",\"group\":\"2\",\"noun\":\"\"}]', 0, 2, 2), ('quotes', 'Quotes', '', '[{\"id\":\"page_header\",\"title\":\"Page Header\",\"subtitle\":\"\",\"type\":\"text\"},{\"id\":\"callouts\",\"title\":\"Callouts\",\"subtitle\":\"\",\"type\":\"callouts\",\"group\":\"2\",\"noun\":\"\"}]', 0, 0, 0), ('trees', 'Trees', 'on', '[{\"id\":\"page_header\",\"title\":\"Page Header\",\"subtitle\":\"\",\"type\":\"text\"}]', 1, 0, 1);

CREATE TABLE `demo_quotes` (`id` int(11) unsigned NOT NULL AUTO_INCREMENT, `quote` varchar(255) NOT NULL DEFAULT '', `author` varchar(255) NOT NULL DEFAULT '', `source` varchar(255) NOT NULL DEFAULT '', `approved` char(2) NOT NULL DEFAULT '', `position` int(11) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `demo_quotes` (`id`, `quote`, `author`, `source`, `approved`, `position`) VALUES (1, 'To dwellers in a wood, almost every species of tree has its voice as well as its feature.', 'Thomas Hardy', 'Under the Greenwood Tree ', 'on', 0), (2, 'The creation of a thousand forests is in one acorn', 'Ralph Waldo Emerson', '', 'on', 0), (3, 'The clearest way into the Universe is through a forest wilderness.', 'John Muir', '', 'on', 0), (4, 'Love the trees until their leaves fall off, then encourage them to try again next year.', 'Chad Sugg', '', 'on', 0), (5, 'A cold wind was blowing from the north, and it made the trees rustle like living things.', 'George R.R. Martin', 'A Game of Thrones ', 'on', 0), (6, 'Trees\'re always a relief, after people.', 'David Mitchell', 'Black Swan Green', 'on', 0), (7, 'We need to save the forests. I have a big warehouse we can store them in.', 'Bauvard', 'Some Inspiration for the Overenthusiastic ', 'on', 0), (8, 'There is always music amongst the trees in the Garden, but our hearts must be very quiet to hear it.', 'Minnie Aumonier', '', 'on', 0), (9, 'Trees are poems that the earth writes upon the sky.', 'Kahlil Gibran', 'Sand and Foam', 'on', 0), (10, 'All our wisdom is stored in the trees.', 'Santosh Kalwar', '', 'on', 0), (11, 'There are rich counsels in the trees.', 'Herbert P. Horne', '', 'on', 0), (12, 'Trees are as close to immortality as the rest of us ever come.', 'Karen Joy Fowler', 'Sarah Canary', 'on', 0), (13, 'I think that I shall never see a poem lovely as a tree.', 'Joyce Kilmer', 'Trees &amp; Other Poems ', 'on', 0), (14, 'Great songs don\'t grow on trees, yet lots of songs have been written on great trees', 'Benny Bellamacina', 'Philosophical Uplifting Quotes and Poems ', 'on', 0), (15, 'I\'m planting a tree to teach me to gather strength from my deepest roots.', 'Andrea Koehle Jones', 'The Wish Trees', 'on', 0);

CREATE TABLE `demo_trees` (`id` int(11) unsigned NOT NULL AUTO_INCREMENT, `title` varchar(255) NOT NULL DEFAULT '', `subtitle` varchar(255) NOT NULL DEFAULT '', `route` varchar(255) NOT NULL DEFAULT '', `content` text NOT NULL, `cover` varchar(255) NOT NULL DEFAULT '', `cover_attribution` varchar(255) NOT NULL DEFAULT '', `cover_link` varchar(255) NOT NULL DEFAULT '', `gallery` text NOT NULL, `link` varchar(255) NOT NULL DEFAULT '', `position` int(11) NOT NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `demo_trees` (`id`, `title`, `subtitle`, `route`, `content`, `cover`, `cover_attribution`, `cover_link`, `gallery`, `link`, `position`) VALUES (1, 'The Oak', 'A Genus of Quercus In The Fagaceae Family', 'oak', '<p>Oak trees grow in many parts of Europe and North America. Many people who own wooded land in these parts of the world are proud of their oak trees. Oak is a climax vegetation in much of the Northern Hemisphere. What that means is, left untouched by humans, it would be the dominant tree. Much of England was covered by oak forests before modern farming took over the land.</p>\r\n<blockquote>\r\n<p>There are over 300 varieties of oak trees; some live up to 1000 years.</p>\r\n</blockquote>\r\n<p>Most oak trees lose all of their leaves in autumn. Some kinds of oak tree, the &ldquo;live oak&rdquo;, that grows in the American South or the Holm oak that grows in Europe keep their leaves through winter It is called the &ldquo;live oak&rdquo; in the United States of America because it keeps many of its leaves during winter.</p>', 'https://bigtree-demo-site.s3.amazonaws.com/files/trees/oak-2-aladin.jpg', 'mossholder', 'http://www.sxc.hu/photo/1432776', '[{\"image\":\"https://bigtree-demo-site.s3.amazonaws.com/files\\/trees\\/oak-3-aladin.jpg\",\"caption\":\"\",\"attribution\":\"Andreas Krappweis\",\"link\":\"http:\\/\\/www.sxc.hu\\/photo\\/1410439\"},{\"image\":\"https://bigtree-demo-site.s3.amazonaws.com/files\\/trees\\/oak-1-aladin.jpg\",\"caption\":\"\",\"attribution\":\"Andreas Krappweis\",\"link\":\"http:\\/\\/www.sxc.hu\\/photo\\/1429336\"},{\"image\":\"https://bigtree-demo-site.s3.amazonaws.com/files\\/trees\\/oak-4-aladin.jpg\",\"caption\":\"\",\"attribution\":\"Andreas Krappweis\",\"link\":\"http:\\/\\/www.sxc.hu\\/photo\\/1425978\"},{\"image\":\"https://bigtree-demo-site.s3.amazonaws.com/files\\/trees\\/oak-8-aladin.jpg\",\"caption\":\"\",\"attribution\":\"Milan Jurek\",\"link\":\"http:\\/\\/www.sxc.hu\\/photo\\/1379378\"},{\"image\":\"https://bigtree-demo-site.s3.amazonaws.com/files\\/trees\\/oak-6-aladin.jpg\",\"caption\":\"\",\"attribution\":\"Florin Garoi\",\"link\":\"http:\\/\\/www.sxc.hu\\/photo\\/1363963\"},{\"image\":\"https://bigtree-demo-site.s3.amazonaws.com/files\\/trees\\/oak-7-aladin.jpg\",\"caption\":\"\",\"attribution\":\"Hanspeter Klasser\",\"link\":\"http:\\/\\/www.sxc.hu\\/photo\\/1118207\"},{\"image\":\"https://bigtree-demo-site.s3.amazonaws.com/files\\/trees\\/oak-5-aladin.jpg\",\"caption\":\"\",\"attribution\":\"Milan Jurek\",\"link\":\"http:\\/\\/www.sxc.hu\\/photo\\/1368880\"},{\"image\":\"https://bigtree-demo-site.s3.amazonaws.com/files\\/trees\\/oak-10-aladin.jpg\",\"caption\":\"\",\"attribution\":\"Jack Smott\",\"link\":\"http:\\/\\/www.sxc.hu\\/photo\\/684270\"}]', 'http://en.wikipedia.org/wiki/Oak', 0), (2, 'The Sequoia', 'A Genus Of Redwood In The Cupressaceae Family', 'sequoia', '<p>Sequoia is a genus of redwood trees in the Cupressaceae family. It includes the largest trees in the world. The only living species of the genus is the Sequoia sempervirens, which is found in northern California and southern Oregon in the United States. Several other species have been named from fossils, but are now extinct. These include Sequoia affinis, Sequoia chinensis in China, Sequoia langsdorfii, Sequoia dakotensis of South Dakota, and Sequoia magnifica.</p>\r\n<blockquote>\r\n<p>The Sequoia National Park is home to the tallest tree in the world.</p>\r\n</blockquote>\r\n<p>These trees grow only in 75 groups across 35,600 acres in California, near the Sierra Nevada mountains. These groups were formed as a protection from logging. The most famous area with sequoia trees is Sequoia National Park. The park was found as a second national park after the Yellowstone National Park in 1980. The Sequoia National Park is managed with Kings Canyon National Park. Both parks are together called Sequoia and Kings Canyon National Parks. Several trees in Sequoia National Park have even been named, for example General Grant, the Grizzly Giant or General Sherman.</p>', 'https://bigtree-demo-site.s3.amazonaws.com/files/trees/sequoia-6-aladin.jpg', 'Marcin Jochimczyk', 'http://www.sxc.hu/photo/738542', '[{\"image\":\"https://bigtree-demo-site.s3.amazonaws.com/files\\/trees\\/sequoia-10-aladin.jpg\",\"caption\":\"\",\"attribution\":\"Whitney Tucker\",\"link\":\"http:\\/\\/www.sxc.hu\\/photo\\/1154927\"},{\"image\":\"https://bigtree-demo-site.s3.amazonaws.com/files\\/trees\\/sequoia-9-aladin.jpg\",\"caption\":\"\",\"attribution\":\"Mo Montgomery\",\"link\":\"http:\\/\\/www.sxc.hu\\/photo\\/769683\"},{\"image\":\"https://bigtree-demo-site.s3.amazonaws.com/files\\/trees\\/sequoia-1-aladin.jpg\",\"caption\":\"\",\"attribution\":\"Gavin Mills\",\"link\":\"http:\\/\\/www.sxc.hu\\/photo\\/756224\"},{\"image\":\"https://bigtree-demo-site.s3.amazonaws.com/files\\/trees\\/sequoia-3-aladin.jpg\",\"caption\":\"\",\"attribution\":\"Vlad Romascanu\",\"link\":\"http:\\/\\/www.sxc.hu\\/photo\\/90787\"},{\"image\":\"https://bigtree-demo-site.s3.amazonaws.com/files\\/trees\\/sequoia-2-aladin.jpg\",\"caption\":\"\",\"attribution\":\"Colin Brough\",\"link\":\"http:\\/\\/www.sxc.hu\\/photo\\/1159480\"},{\"image\":\"https://bigtree-demo-site.s3.amazonaws.com/files\\/trees\\/sequoia-7-aladin.jpg\",\"caption\":\"\",\"attribution\":\"Patrycja Cieszkowska\",\"link\":\"http:\\/\\/www.sxc.hu\\/photo\\/787471\"},{\"image\":\"https://bigtree-demo-site.s3.amazonaws.com/files\\/trees\\/sequoia-8-aladin.jpg\",\"caption\":\"\",\"attribution\":\"Ji Ro\",\"link\":\"http:\\/\\/www.sxc.hu\\/photo\\/307540\"},{\"image\":\"https://bigtree-demo-site.s3.amazonaws.com/files\\/trees\\/sequoia-4-aladin.jpg\",\"caption\":\"\",\"attribution\":\"Sue Piozet\",\"link\":\"http:\\/\\/www.sxc.hu\\/photo\\/467272\"}]', 'http://en.wikipedia.org/wiki/Sequoia', 0), (3, 'The Pine', 'A Genus Of Conifers In The Pinaceae Family', 'pine', '<p>Pines live in almost the entire Northern Hemisphere. In North America, they live in the southern part of Arctic to Nicaragua and Hispaniola. In Europe, they live in areas from Portugal and Scotland to Russia. In Asia, they live in areas from Russia to Japan and the Philippines. They also live in the Himalayas, some northern parts of Africa, and north of Majorca (Mallorca) on the rugged mountains.</p>\r\n<blockquote>\r\n<p>There are about 115 species making up the sub-family Pinoideae.</p>\r\n</blockquote>\r\n<p>Pines are long-lived, typically reaching ages of 100&ndash;1,000 years, some even more. The longest-lived is the Great Basin Bristlecone Pine, Pinus longaeva. One individual of this species, dubbed Methuselah, is one of the world&rsquo;s oldest living organisms at around 4,600 years old. This tree can be found in the White Mountains of California.</p>', 'https://bigtree-demo-site.s3.amazonaws.com/files/trees/pine-2-aladin.jpg', 'Chance Agrella', 'http://freerangestock.com/details.php?gid=&amp;sgid=&amp;pid=352', '[{\"image\":\"https://bigtree-demo-site.s3.amazonaws.com/files\\/trees\\/pine-1-aladin.jpg\",\"caption\":\"\",\"attribution\":\"Chance Agrella\",\"link\":\"http:\\/\\/freerangestock.com\\/details.php?gid=&amp;sgid=&amp;pid=268\"},{\"image\":\"https://bigtree-demo-site.s3.amazonaws.com/files\\/trees\\/pine-3-aladin.jpg\",\"caption\":\"\",\"attribution\":\"Flash Alexander\",\"link\":\"http:\\/\\/freerangestock.com\\/details.php?gid=&amp;sgid=&amp;pid=5970\"},{\"image\":\"https://bigtree-demo-site.s3.amazonaws.com/files\\/trees\\/pine-4-aladin.jpg\",\"caption\":\"\",\"attribution\":\"Chance Agrella\",\"link\":\"http:\\/\\/freerangestock.com\\/details.php?gid=&amp;sgid=&amp;pid=1151\"},{\"image\":\"https://bigtree-demo-site.s3.amazonaws.com/files\\/trees\\/pine-5-aladin.jpg\",\"caption\":\"\",\"attribution\":\"Chance Agrella\",\"link\":\"http:\\/\\/freerangestock.com\\/details.php?gid=&amp;sgid=&amp;pid=307\"},{\"image\":\"https://bigtree-demo-site.s3.amazonaws.com/files\\/trees\\/pine-10-aladin.jpg\",\"caption\":\"\",\"attribution\":\"Aleksandar Momirovic\",\"link\":\"http:\\/\\/freerangestock.com\\/details.php?gid=&amp;sgid=&amp;pid=3787\"},{\"image\":\"https://bigtree-demo-site.s3.amazonaws.com/files\\/trees\\/pine-9-aladin.jpg\",\"caption\":\"\",\"attribution\":\"Bradley Strong\",\"link\":\"http:\\/\\/freerangestock.com\\/details.php?gid=&amp;sgid=&amp;pid=3109\"},{\"image\":\"https://bigtree-demo-site.s3.amazonaws.com/files\\/trees\\/pine-7-aladin.jpg\",\"caption\":\"\",\"attribution\":\"Chance Agrella\",\"link\":\"http:\\/\\/freerangestock.com\\/details.php?gid=&amp;sgid=&amp;pid=1152\"},{\"image\":\"https://bigtree-demo-site.s3.amazonaws.com/files\\/trees\\/pine-6-aladin.jpg\",\"caption\":\"\",\"attribution\":\"Chance Agrella\",\"link\":\"http:\\/\\/freerangestock.com\\/details.php?gid=&amp;sgid=&amp;pid=375\"}]', 'http://en.wikipedia.org/wiki/Pine', 0);

SET SESSION foreign_key_checks = 1;