component persistent="true" entityname="contact" table="contact"  {

    property name="id" column="id" fieldtype="id" generator="increment";
    property name="title" column="title" ormtype="int" fieldtype="many-to-one" cfc="addressbook.entities.title" lazy="false";
    property name="firstName" column="first_name" ormtype="string";
    property name="lastName" column="last_name" ormtype="string";
    property name="email" column="email" ormtype="string";
    property name="address" column="address" ormtype="string";
    property name="phone" column="phone" ormtype="string";
    property name="photo" column="photo" ormtype="string";
    property name="gender" column="gender" ormtype="int" fieldtype="many-to-one" cfc="addressbook.entities.gender" lazy="false";
    property name="dob" column="dob" ormtype="date";
    property name="city" column="city" ormtype="int" fieldtype="many-to-one" cfc="addressbook.entities.cities" lazy="false";
    property name="state" column="state" ormtype="int" fieldtype="many-to-one" cfc="addressbook.entities.states" lazy="false";
    property name="country" column="country" ormtype="int" fieldtype="many-to-one" cfc="addressbook.entities.countries" lazy="false";
    property name="pincode" column="pincode" ormtype="int";
    property name="userCreated" column="user_created" ormtype="int" fieldtype="many-to-one" cfc="addressbook.entities.user" lazy="false";

    function getName() {
        return uCase( variables.firstName & ' ' & variables.lastName );
    }
}