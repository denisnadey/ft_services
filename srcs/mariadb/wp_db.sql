-- CREATE TABLE `wp_users` (
--   `ID` bigint(20) UNSIGNED NOT NULL,
--   `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
--   `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
--   `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
--   `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
--   `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
--   `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
--   `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
--   `user_status` int(11) NOT NULL DEFAULT 0,
--   `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
-- (2, 'user1', '$P$BQhf7VLeZ4N7bPw.CLFQemRW56viCz/', 'user1', 'user1@user1.user1', '', '2020-11-15 12:07:56', '', 0, 'user1'),
-- (3, 'user2', '$P$BxtMNMYRgoavR4TSdtT3IZg7W4PF5j1', 'user2', 'user2@user2.user2', '', '2020-11-15 12:08:27', '', 0, 'user2'),
-- (4, 'user3', '$P$Bx7PM/YyrBNrNGBXOT7MBZ/RAIyOGb.', 'user3', 'user3@user3.user3', '', '2020-11-15 12:08:50', '', 0, 'user3');

-- ALTER TABLE `wp_users`
--   ADD PRIMARY KEY (`ID`),
--   ADD KEY `user_login_key` (`user_login`),
--   ADD KEY `user_nicename` (`user_nicename`),
--   ADD KEY `user_email` (`user_email`);

-- ALTER TABLE `wp_users`
--   MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
-- COMMIT;