local M = {}

function M.run_command(command)
	os.execute(command)
end

function M.run_commands(commands)
	local command = table.concat(commands, " && ")
	os.execute(command)
end

function M.run_packages(packages)
	table.insert(packages, 1, "yay -S --needed --noconfirm --sudoloop")
	local command = table.concat(packages, " ")
	M.run_command(command)
end

function M.run_setup(setup)
	if setup == nil then
		print("No setup to run")
		return
	end

	if setup.before then
		print(setup.name)
		setup.before()
	end

	if setup.packages then
		print(setup.name)
		M.run_packages(setup.packages)
	end

	if setup.after then
		print(setup.name)
		setup.after()
	end
end

function M.run_setups(setups)
	if setups == nil or #setups < 1 then
		print("No setups to run")
		return
	end

	for _, setup in ipairs(setups) do
		if setup.before then
			print("Running before for", setup.name)
			setup.before()
		end
	end

	print("Installing packages...")
	local packages = {}
	for _, setup in ipairs(setups) do
		if setup.packages then
			for _, package in ipairs(setup.packages) do
				table.insert(packages, package)
			end
		end
	end

	if #packages > 0 then
		M.run_packages(packages)
	end

	for _, setup in ipairs(setups) do
		if setup.after then
			print("Running after for", setup.name)
			setup.after()
		end
	end
end

function M.run_profile(profile)
	print("Running profile", profile.name)
	if profile.setups then
		M.run_setups(profile.setups)
	end
end

return M
