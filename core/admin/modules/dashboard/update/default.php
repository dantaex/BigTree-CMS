<?
	$breadcrumb[] = array("title" => "System Update", "link" => "#");
	
	$current_revision = $cms->getSetting("bigtree-internal-revision");
	// If we recently upgraded...
	if ($current_revision < BIGTREE_REVISION) {		
		// Start the upgrade process if we've already said OK.
		if (count($_POST)) {
			while ($current_revision < BIGTREE_REVISION) {
				$current_revision++;
				if (function_exists("_local_bigtree_update_".$current_revision)) {
					eval("_local_bigtree_update_$current_revision();");
				}
			}
		
			$admin->updateSettingValue("bigtree-internal-revision",BIGTREE_REVISION);
?>
<h1><span class="developer"></span>System Update</h1>
<div class="form_container">
	<form method="post" action="">
		<section>
			<p>Your update is complete.</p>
		</section>
		<footer>
			<a href="<?=$admin_root?>dashboard/" class="button blue">Return to Dashboard</a>
		</footer>
	</form>
</div>
<?
		// See if there are db/fs updates available to run and confirm with them they've backed up their DB for continuing.
		} else {
			$updates_exist = false;
			while ($current_revision < BIGTREE_REVISION) {
				$current_revision++;
				if (function_exists("_local_bigtree_update_".$current_revision)) {
					$updates_exist = true;
				}
			}
			
			// If we don't have anything to run, just update the revision number and return to the dashboard.
			if (!$updates_exist) {
				$admin->updateSettingValue("bigtree-internal-revision",BIGTREE_REVISION);
				header("Location: ".$admin_root."dashboard/");
				die();
			}
?>
<h1><span class="developer"></span>System Update</h1>
<div class="form_container">
	<form method="post" action="">
		<section>
			<p>BigTree has been updated to <?=BIGTREE_VERSION?>.</p>
			<p>
				Your database and/or filesystem needs to be upgraded to be compatible with this version.<br />
				It is recommended that you <strong>backup your old database</strong> before continuing.
			</p>
		</section>
		<footer>
			<input type="submit" class="button blue" name="upgrade" value="Upgrade Database" />
		</footer>
	</form>
</div>
<?
		}
	} else {
?>

<h1><span class="developer"></span>System Update</h1>
<div class="form_container">
	<section>
		<p>BigTree is up to date.</p>
	</section>
	<footer>
		<a href="<?=$admin_root?>dashboard/" class="button blue">Return to Dashboard</a>
	</footer>
</div>
<?	
	}

	// BigTree 4.0b5 update -- REVISION 1
	function _local_bigtree_update_1() {
		global $cms,$admin;
		
		// Update settings to make the value LONGTEXT
		sqlquery("ALTER TABLE `bigtree_settings` CHANGE `value` `value` LONGTEXT");
		
		// Drop the css/javascript columns from bigtree_module_forms and add preprocess
		sqlquery("ALTER TABLE `bigtree_module_forms` ADD COLUMN `preprocess` varchar(255) NOT NULL AFTER `title`, DROP COLUMN `javascript`, DROP COLUMN `css`");
		
		// Add the "trunk" column to bigtree_pages
		sqlquery("ALTER TABLE `bigtree_pages` ADD COLUMN `trunk` char(2) NOT NULL AFTER `id`");
		sqlquery("UPDATE `bigtree_pages` SET `trunk` = 'on' WHERE id = '0'");
		
		// Move Google Analytics information into a single setting
		$ga_cache = $cms->getSetting("bigtree-internal-google-analytics-cache");
		$ga_email = $cms->getSetting("bigtree-internal-google-analytics-email");
		$ga_password = $cms->getSetting("bigtree-internal-google-analytics-password");
		$ga_profile = $cms->getSetting("bigtree-internal-google-analytics-profile");
		
		$admin->createSetting(array(
			"id" => "bigtree-internal-google-analytics",
			"system" => "on",
			"encrypted" => "on"
		));
		$admin->updateSettingValue("bigtree-internal-google-analytics",array(
			"cache" => $ga_cache,
			"email" => $ga_email,
			"password" => $ga_password,
			"profile" => $ga_profile
		));
		
		
		// Update the upload service setting to be encrypted.		
		$admin->updateSetting("bigtree-internal-upload-service",array(
			"id" => "bigtree-internal-upload-service",
			"system" => "on",
			"encrypted" => "on"
		));
		$us = $cms->getSetting("bigtree-internal-upload-service");

		// Move Rackspace into the main upload service
		$rs_containers = $cms->getSetting("bigtree-internal-rackspace-containers");
		$rs_keys = $cms->getSetting("bigtree-internal-rackspace-containers");
		
		$us["rackspace"] = array(
			"containers" => $rs_containers,
			"keys" => $rs_keys
		);
		
		// Move Amazon S3 into the main upload service
		$s3_buckets = $cms->getSetting("bigtree-internal-s3-buckets");
		$s3_keys = $cms->getSetting("bigtree-internal-s3-keys");
		
		$us["s3"] = array(
			"buckets" => $s3_buckets,
			"keys" => $s3_keys
		);
		
		// Update the upload service value.
		$admin->updateSettingValue("bigtree-internal-upload-service",$us);
		
		// Create the revision counter
		$admin->createSetting(array(
			"id" => "bigtree-internal-revision",
			"system" => "on"
		));
		
		// Delete all the old settings.
		sqlquery("DELETE FROM bigtree_settings WHERE id = 'bigtree-internal-google-analytics-cache' OR id = 'bigtree-internal-google-analytics-email' OR id = 'bigtree-internal-google-analytics-password' OR id = 'bigtree-internal-google-analytics-profile' OR id = 'bigtree-internal-rackspace-keys' OR id = 'bigtree-internal-rackspace-containers' OR id = 'bigtree-internal-s3-buckets' OR id = 'bigtree-internal-s3-keys'");
	}
?>