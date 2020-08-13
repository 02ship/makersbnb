require 'user'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'user@user.com', name: 'Ilja', password: '123456')
      expect(user).to be_a(User)
      expect(user.email).to eq('user@user.com')
      expect(user.name).to eq('Ilja')
    end
    it 'encrypts the password with bcrypt' do
      allow(BCrypt::Password).to receive(:create)
      User.create(email: 'test@test.com', name: 'Test_user', password: 'test_password')
      expect(BCrypt::Password).to have_received(:create).with('test_password')
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
  describe '.authenticate' do
    it 'returns username and password if one exists' do
        user = User.create(email: 'user@user.com', name: 'Ilja', password: '123456')
        authenticated_user = User.authenticate(email: 'user@user.com', password: '123456')
        expect(authenticated_user.id).to eq(user.id)
    end
    it "return nil if email is wrong" do
      user = User.create(email: 'user@user.com', name: 'Ilja', password: '123456')
      expect(User.authenticate(email: 'wrong@user.com', password: '123456')).to be_nil
    end

    it 'returns nil if password is wrong' do
      user = User.create(email: 'user@user.com', name: 'Ilja', password: '123456')
      expect(User.authenticate(email: 'user@user.com', password: '12345')).to be_nil
  end
end
end
