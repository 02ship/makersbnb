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
    it 'encrypts the password with bcrypt' do
      allow(BCrypt::Password).to receive(:create)
      allow(BCrypt::Password).to receive(:new)
      User.create(email: 'test@test.com', name: 'Test_user', password: 'test_password')
      expect(BCrypt::Password).to have_received(:create).with('test_password')
      expect(BCrypt::Password).to have_received(:new)
    end
  end
  describe '.find' do
    it 'finds a user based on id' do
      user = User.create(email: 'user@user.com', name: 'Ilja', password: '123456')
      result = User.find(id: user.id)
      expect(result.id).to eq(user.id)
      expect(result.email).to eq(user.email)
      expect(result.name).to eq(user.name)
    end
  end
end
