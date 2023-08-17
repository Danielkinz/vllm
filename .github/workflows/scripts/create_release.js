const core = require('@actions/core');

async function run(github, context) {
	try {
		const response = await github.rest.repos.createRelease({
			draft: false,
			generate_release_notes: true,
			name: process.env.RELEASE_TAG,
			owner: context.repo.owner,
			prerelease: false,
			repo: context.repo.repo,
			tag_name: process.env.RELEASE_TAG,
		});
	
		core.exportVariable('release_id', response.data.id);
		core.exportVariable('upload_url', response.data.upload_url);
	} catch (error) {
		core.setFailed(error.message);
	}
}

module.exports = (github, context) => {
	run(github, context)
}