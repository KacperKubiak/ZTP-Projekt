defmodule AuthServer.AccountTest do
  use AuthServer.DataCase

  alias AuthServer.Account

  describe "users" do
    alias AuthServer.Account.User

    import AuthServer.AccountFixtures

    @invalid_attrs %{clientId: nil, exp: nil, name: nil, secret: nil, token: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Account.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Account.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{clientId: "some clientId", exp: 42, name: "some name", secret: "some secret", token: "some token"}

      assert {:ok, %User{} = user} = Account.create_user(valid_attrs)
      assert user.clientId == "some clientId"
      assert user.exp == 42
      assert user.name == "some name"
      assert user.secret == "some secret"
      assert user.token == "some token"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{clientId: "some updated clientId", exp: 43, name: "some updated name", secret: "some updated secret", token: "some updated token"}

      assert {:ok, %User{} = user} = Account.update_user(user, update_attrs)
      assert user.clientId == "some updated clientId"
      assert user.exp == 43
      assert user.name == "some updated name"
      assert user.secret == "some updated secret"
      assert user.token == "some updated token"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_user(user, @invalid_attrs)
      assert user == Account.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Account.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Account.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Account.change_user(user)
    end
  end

  describe "users" do
    alias AuthServer.Account.User

    import AuthServer.AccountFixtures

    @invalid_attrs %{-: nil, clientId: nil, exp: nil, name: nil, "no-context": nil, "no-schema": nil, secret: nil, token: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Account.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Account.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{-: "some -", clientId: "some clientId", exp: 42, name: "some name", "no-context": "some no-context", "no-schema": "some no-schema", secret: "some secret", token: "some token"}

      assert {:ok, %User{} = user} = Account.create_user(valid_attrs)
      assert user.- == "some -"
      assert user.clientId == "some clientId"
      assert user.exp == 42
      assert user.name == "some name"
      assert user.no-context == "some no-context"
      assert user.no-schema == "some no-schema"
      assert user.secret == "some secret"
      assert user.token == "some token"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{-: "some updated -", clientId: "some updated clientId", exp: 43, name: "some updated name", "no-context": "some updated no-context", "no-schema": "some updated no-schema", secret: "some updated secret", token: "some updated token"}

      assert {:ok, %User{} = user} = Account.update_user(user, update_attrs)
      assert user.- == "some updated -"
      assert user.clientId == "some updated clientId"
      assert user.exp == 43
      assert user.name == "some updated name"
      assert user.no-context == "some updated no-context"
      assert user.no-schema == "some updated no-schema"
      assert user.secret == "some updated secret"
      assert user.token == "some updated token"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_user(user, @invalid_attrs)
      assert user == Account.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Account.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Account.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Account.change_user(user)
    end
  end
end
