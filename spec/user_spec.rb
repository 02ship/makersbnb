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
end
