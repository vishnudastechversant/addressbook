component persistent="true"  entityname="user" table="user" {

    property name="id" column="id" fieldtype="id" generator="increment";
    property name="firstName" column="first_name" ormtype="string";
    property name="lastName" column="last_name" ormtype="string";
    property name="userName" column="username" ormtype="string";
    property name="password" column="password" ormtype="string";
    property name="email" column="email" ormtype="string";
    property name="phone" column="phone" ormtype="string" notnull="true";
    property name="profileImage" column="profile_img" ormtype="string" notnull="true";

    function getName() {
        name = variables.firstName & ' ' & variables.lastName;
        return name;
    }
}