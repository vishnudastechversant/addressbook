component persistent="true"  entityname="cities" table="tbl_cities" {

    property name="id" column="id" fieldtype="id" generator="increment";
    property name="name" column="name" ormtype="string";
    property name="stateId" fkcolumn="state_id" fieldtype="many-to-one" cfc="states";
}