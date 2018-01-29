# # encoding: utf-8

# Inspec test for recipe segulja_users::users

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe user('michael') do
  it { should exist }
end

describe user('localuser') do
  it { should exist }
end

describe user('oracle') do
  it { should exist }
end
