const db = require('../data/db-config');

module.exports = {
    find,
    findById, 
    findSteps,
    add,
    update,
    remove
}

function find () {
    return db('schemes');
};

function findById (id) {
    return db('schemes')
    .where('id', id)
    .first();
};

function findSteps (id) {
    return db('steps')
    .join('schemes' , 'schemes.id', 'steps.scheme_id')
    .select('steps.id', 'schemes.scheme_name', 'steps.instructions').where('scheme_id' , id)
};

function add(newScheme) {
    return db('schemes')
    .insert(newScheme)
    .then(ids => {
    return findById(ids[0]);
    });
}

function update(changes, id) {
    return db('schemes')
    .where('id' , id)
    .update(changes)
    .then(count => {
    count > 0 ? findById(id) : null
    });
};

function remove (id) {
    return db('schemes')
    .where('id' , id)
    .del();
};