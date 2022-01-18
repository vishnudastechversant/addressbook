component persistent="true"  entityname="user" table="user" {

    property name="id" column="id" fieldtype="id" generator="increment";
    property name="firstName" column="first_name" ormtype="string";
    property name="lastName" column="last_name" ormtype="string";
    property name="userName" column="username" ormtype="string";
    property name="password" column="password" ormtype="string";
    property name="email" column="email" ormtype="string";
    property name="phone" column="phone" ormtype="string" notnull="true";
    property name="profileImage" column="profile_img" ormtype="string" notnull="true";
    property name="createdAt" column="created_at" ormtype="date" notnull="true";
    property name="updatedAt" column="updatedAt" ormtype="date" notnull="true";

    function getName() {
        return uCase( variables.firstName + ' ' + variables.lastName );
    }
}