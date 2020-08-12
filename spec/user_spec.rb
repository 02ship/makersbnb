require 'user'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'user@user.com', name: 'Ilja', password: '123456')
      expect(user).to be_a(User)
      expect(user.email).to eq('user@user.com')
      expect(user.name).to eq('Ilja')
      expect(user.password).to eq('123456')
    end
  end
end
